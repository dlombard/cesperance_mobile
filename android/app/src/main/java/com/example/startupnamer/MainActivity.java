package com.example.startupnamer;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.util.Log;

import com.google.android.gms.tasks.Continuation;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;
import com.mongodb.stitch.android.core.StitchAppClient;
import com.mongodb.stitch.android.core.auth.StitchUser;
import com.mongodb.stitch.android.services.mongodb.remote.RemoteMongoCollection;
import com.mongodb.stitch.core.auth.providers.anonymous.AnonymousCredential;
import com.mongodb.stitch.core.services.mongodb.remote.sync.ChangeEventListener;
import com.mongodb.stitch.core.services.mongodb.remote.sync.DefaultSyncConflictResolvers;
import com.mongodb.stitch.core.services.mongodb.remote.sync.ErrorListener;
import com.mongodb.stitch.core.services.mongodb.remote.sync.SyncDeleteResult;
import com.mongodb.stitch.core.services.mongodb.remote.sync.SyncUpdateOptions;
import com.mongodb.stitch.core.services.mongodb.remote.sync.SyncUpdateResult;
import com.mongodb.stitch.core.services.mongodb.remote.sync.internal.ChangeEvent;

import org.bson.BsonValue;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Set;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private _Stitch stitch = new _Stitch();
  private StitchAppClient _client = stitch.getClient();
  private RemoteMongoCollection<Document> favs;
  private RemoteMongoCollection<Document> songs;
  private MethodChannel stitchChannel;

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    stitchChannel = new MethodChannel(getFlutterView(), "ce.dlo.io/Stitch");
    initStitch(this);
  }

  void initStitch(MainActivity a) {
    stitch.getClient().getAuth().loginWithCredential(new AnonymousCredential()).addOnSuccessListener(new OnSuccessListener<StitchUser>() {
      @Override
      public void onSuccess(StitchUser stitchUser) {
        System.out.println("Login successful");
        favs = stitch.getMongoClient().getDatabase("cesperance").getCollection("device_favorites");
        songs = stitch.getMongoClient().getDatabase("cesperance").getCollection("songs");
        favs.sync().configure(
                DefaultSyncConflictResolvers.localWins(),
                new MyUpdateListener(favs),
                new MyErrorListener(favs));
          songs.sync().configure(
                  DefaultSyncConflictResolvers.remoteWins(),
                  new MyUpdateListener(songs),
                  new MyErrorListener(songs));
        initStitchChannel();
        GeneratedPluginRegistrant.registerWith(a);
      }
    }).addOnFailureListener(new OnFailureListener() {
      @Override
      public void onFailure(@NonNull Exception e) {
        System.out.println("Failed Login " + e.getMessage());
      }
    });
  }

  void initStitchChannel() {
      stitchChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
      @Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

        switch (methodCall.method) {
          case "getUserId":result.success(_client.getAuth().getUser().getId());
            break;
          case "getSongs":

            getSongs(methodCall.argument("book"), methodCall.argument("lang")).addOnCompleteListener(new OnCompleteListener<List<Document>>() {
              @Override
              public void onComplete(@NonNull Task<List<Document>> task) {
                result.success(convertDocsToSongs(task.getResult()));
              }
            });
            break;
          case "getFavorites":

            getFavorites(methodCall.argument("deviceId")).addOnCompleteListener(new OnCompleteListener<List<Document>>() {
              @Override
              public void onComplete(@NonNull Task<List<Document>> task) {
                result.success(convertDocsToSongs(task.getResult()));
              }
            });
            break;
          case "insertFavorite":
            insertFavorites(methodCall.argument("deviceId"), methodCall.argument("id")).addOnCompleteListener(new OnCompleteListener<SyncUpdateResult>() {
              @Override
              public void onComplete(@NonNull Task<SyncUpdateResult> task) {
                  System.out.println("IS COMPLETED: " + task.isComplete());
                result.success(true);
              }
            });
            break;
          case "deleteFavorite":
            deleteFavorite(methodCall.argument("deviceId"), methodCall.argument("id")).addOnCompleteListener(new OnCompleteListener<SyncDeleteResult>() {
              @Override
              public void onComplete(@NonNull Task<SyncDeleteResult> task) {
                result.success(true);
              }
            });
            break;
          default:
            break;
        }
      }
    });
  }

  Task<List<Document>> getSongs(String book, String lang){

    List<Document> results = new ArrayList<>();
    return songs.find(new Document("book.abbrv", book).append("language",lang)).sort(new Document("num", 1)).into(results);
  }


  Task<List<Document>> getSongsFromIds(List<ObjectId>ids){
    List<Document> results = new ArrayList<>();
    return songs.aggregate(Arrays.asList(Aggregates.match(Filters.in("_id",ids)))).into(results);
  }

  List<String> convertDocsToSongs(List<Document> docs){
    List<String> songs = new ArrayList<>();
    for(final Document doc : docs){
      String id = doc.getObjectId("_id").toHexString();

      doc.remove("_id");
      doc.append("_id", id);
      songs.add(doc.toJson());
    }
    return songs;
  }

  Task<List<Document>> getFavorites(String deviceId){

    List<Document> favorites = new ArrayList<>();

   return favs.sync().find(new Document("deviceId", deviceId)).sort(new Document("createdAt", 1)).into(favorites).continueWithTask(new Continuation<List<Document>, Task<List<Document>>>() {
     @Override
     public Task<List<Document>> then(@NonNull Task<List<Document>> task) throws Exception {
       List<ObjectId>ids = new ArrayList<>();
       try{
         for (Document favorite : favorites) {
           ids.add(new ObjectId(favorite.getString("songId")));
         }
       }catch(Exception e){
         System.out.println(e.getMessage());

       }finally {
         return getSongsFromIds(ids);
       }
     }
   });
  }


  Task<SyncUpdateResult> insertFavorites(String deviceId, String id){
      Document set = new Document("$set", new Document("deviceId", deviceId).append("songId", id).append("createdAt", new Date()));
      SyncUpdateOptions options = new SyncUpdateOptions().upsert(true);
    return favs.sync().updateOne(Filters.and(Filters.eq("deviceId", deviceId), Filters.eq("songId", id)),set,options);
  }

  Task<SyncDeleteResult> deleteFavorite(String deviceId, String id){

    return favs.sync().deleteOne(Filters.and(Filters.eq("deviceId", deviceId), Filters.eq("songId", id)));
  }

  private class MyErrorListener implements ErrorListener {
      private RemoteMongoCollection<Document> _remoteCollection;

      public MyErrorListener(RemoteMongoCollection<Document> collection) {
          _remoteCollection = collection;
      }

      @Override
    public void onError(BsonValue documentId, Exception error) {
      Log.e("Stitch", error.getLocalizedMessage());
      Set<BsonValue> docsThatNeedToBeFixed = _remoteCollection.sync().getPausedDocumentIds();
      for (BsonValue doc_id : docsThatNeedToBeFixed) {
          _remoteCollection.sync().resumeSyncForDocument(doc_id);
      }
      // refresh the app view, etc.
    }
  }

  private class MyUpdateListener implements ChangeEventListener<Document> {
      private RemoteMongoCollection<Document> _remoteCollection;

      public MyUpdateListener(RemoteMongoCollection<Document> collection) {
          _remoteCollection = collection;
      }

    @Override
    public void onEvent(final BsonValue documentId, final ChangeEvent<Document> event) {
      if (!event.hasUncommittedWrites()) {
          System.out.println(event.getOperationType());
          stitchChannel.invokeMethod("reloadFavorites", null);
      }
      // refresh the app view, etc.
    }
  }
}


