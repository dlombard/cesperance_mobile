package com.dlombard.cesperance;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.util.Log;

import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.mongodb.MongoBulkWriteException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Aggregates;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import com.mongodb.stitch.android.core.StitchAppClient;
import com.mongodb.stitch.android.core.auth.StitchUser;
import com.mongodb.stitch.core.auth.providers.anonymous.AnonymousCredential;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.json.JSONException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private _Stitch stitch = new _Stitch();
    private StitchAppClient _client = stitch.getClient();
    private MongoCollection<Document> favs;
    private MongoCollection<Document> songs;
    private MongoCollection<Document> localColl;
    private MethodChannel stitchChannel;
    private List<Document> defaultLocalDocuments = new ArrayList<>();
    private static final String CHANNEL = "ce.dlo.io/Stitch";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        stitchChannel = new MethodChannel(getFlutterView(), CHANNEL);
        initStitchChannel();
        initStitch();
    }

    Task<StitchUser> initStitch() {
        defaultLocalDocuments.add(new Document("internalId", "onboarding").append("onboardingDone", false));
        defaultLocalDocuments.add(new Document("internalId", "songsState").append("songsPreloaded", false));

        return stitch.getClient().getAuth().loginWithCredential(new AnonymousCredential());
    }

    void initStitchChannel() {
        stitchChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {

                switch (methodCall.method) {
                    case "initStitch":
                        initStitch().addOnSuccessListener(new OnSuccessListener<StitchUser>() {
                        @Override
                        public void onSuccess(StitchUser stitchUser) {
                            favs = stitch.getMongoClient().getDatabase("chants_desperance").getCollection("favorites");
                            songs = stitch.getMongoClient().getDatabase("chants_desperance").getCollection("songs");
                            localColl = stitch.getMongoClient().getDatabase("chants_desperance").getCollection("meta");


                            songs.createIndex(new Document("book_abbrv", 1).append("language",1).append("num", 1));
                            songs.createIndex(new Document("updated_at", -1));
                            localColl.createIndex(new Document("internalId", 1));

                            List<Document> d = new ArrayList<>();
                            long count = localColl.countDocuments();
                            if (count == 0) {
                                Log.d("LOCALCOLL RESULTS ",  Long.toString(count));
                                localColl.insertMany(defaultLocalDocuments);
                            }

                            result.success(stitchUser.getId());
                        }
                    }).addOnFailureListener(new OnFailureListener() {
                        @Override
                        public void onFailure(@NonNull Exception e) {
                            System.out.println("Failed Login " + e.getMessage());
                            result.error(e.getLocalizedMessage(), e.getMessage(), e);
                        }
                    });;
                        break;
                    case "getUserId":
                        result.success(_client.getAuth().getUser().getId());
                        break;
                    case "getSongs":

                        try {
                            List<Document> results = getSongs(methodCall.argument("book"), methodCall.argument("lang"));
                            result.success(convertDocsToSongs(results));
                        } catch (Exception e) {
                            e.printStackTrace();
                            result.error(e.getMessage(), e.getMessage(), e);
                        }
                        break;
                    case "preloadSongs":
                        try {
                            preloadSongsDB(methodCall.argument("songs"));
                            result.success(true);
                        } catch (MongoBulkWriteException m){
                            if (m.getCode() != 11000) {
                                result.error(m.getLocalizedMessage(), m.toString(), m);
                            }
                        }catch (JSONException j){
                            result.error(j.getLocalizedMessage(), j.toString(), j);
                        }
                        break;

                    case "getFavorites":

                        try {
                            List<Document> results = getFavorites();
                            result.success(convertDocsToSongs(results));
                        } catch (Exception e) {
                            result.error(e.getMessage(), e.getMessage(), e);
                        }

                        break;
                    case "isFavorite":
                        try {
                            result.success(isFavorite(methodCall.argument("id")));
                        } catch (Exception e) {
                            result.error(e.getMessage(), e.getLocalizedMessage(), e);
                        }
                        break;
                    case "insertFavorite":
                        try {
                            UpdateResult r = insertFavorites(methodCall.argument("id"));
                            result.success(true);
                        } catch (Exception e) {
                            result.error(e.getMessage(), e.getMessage(), e);
                        }
                        break;
                    case "deleteFavorite":
                        try {
                            deleteFavorite(methodCall.argument("id"));
                            result.success(true);
                        } catch (Exception e) {
                            result.error(e.getMessage(), e.getMessage(), e);
                        }
                        break;
                    case "getLocalData":
                        String id = methodCall.argument("id");
                        try {
                            if (id == null) {
                                List<Document> r = getLocalData();
                                List<String> json = new ArrayList<>();
                                for(Document doc: r){
                                    json.add(doc.toJson());
                                }
                                result.success(json);
                            } else {
                                result.success(getLocalData(id).toJson());
                            }

                        } catch (Exception e) {
                            result.error(e.getMessage(), e.getLocalizedMessage(), e);
                        }
                        break;
                    case "setOnboarding":
                        try {
                            setOnboarding(methodCall.argument("value"));
                            result.success(true);
                        } catch (Exception e) {
                            result.error(e.getMessage(), e.getLocalizedMessage(), e);
                        }
                        break;
                    case "setLastUpdate":
                        try {
                            setLastUpdate(methodCall.argument("date"));
                            result.success(true);
                        } catch (Exception e) {
                            result.error(e.getMessage(), e.getLocalizedMessage(), e);
                        }
                        break;
                    case "songsPreloaded":
                        try {
                            songsPreloaded(methodCall.argument("value"));
                            result.success(true);
                        } catch (Exception e) {
                            result.error(e.getMessage(), e.getLocalizedMessage(), e);
                        }
                        break;
                    case "getLastUpdatedSongDate":
                        try{
                            result.success(getLastUpdatedSongDate());
                        }catch(Exception e){
                            result.error(e.getMessage(), e.getLocalizedMessage(), e);
                        }
                        break;
                    case "updateSong":
                        try{
                            updateSong(methodCall.argument("song"));
                            result.success(true);
                        }catch(Exception e){
                            result.error(e.getMessage(), e.getLocalizedMessage(), e);
                        }
                        break;
                    default:
                        break;
                }
            }
        });
    }

    List<Document> getLocalData() {

        List<Document> results = new ArrayList<>();
        localColl.find().into(results);
        return results;
    }

    Document getLocalData(String id) {

        return localColl.find(new Document("internalId", id)).first();

    }

    void setOnboarding(Boolean value) {
        localColl.updateOne(new Document("internalId", "onboarding"), new Document("$set", new Document("onboardingDone", value)));
    }

    void setLastUpdate(long time) {
        localColl.updateOne(new Document("internalId", "lastUpdate"), new Document("$set", new Document("lastUpdate", new Date(time))), new UpdateOptions().upsert(true));
    }

    void songsPreloaded(Boolean value) {
        localColl.updateOne(new Document("internalId", "songsState"), new Document("$set", new Document("songsPreloaded", value)));
    }

    List<Document> getSongs(String book, String lang) {

        List<Document> results = new ArrayList<>();
        songs.find(new Document("book_abbrv", book).append("language", lang)).sort(new Document("num", 1)).into(results);

        return results;
    }

    UpdateResult updateSong(String json) throws JSONException{

        Song s = new Song().fromJson(json);
        Document doc = s.toDocument();

        //String id = doc.getString("_id");
        doc.remove("_id");
        return songs.updateOne(new Document("_id", doc.getObjectId("_id")), new Document("$set", doc));
    }

    List<Document> getSongsFromIds(List<ObjectId> ids) {
        List<Document> results = new ArrayList<>();
        songs.aggregate(Arrays.asList(Aggregates.match(Filters.in("_id", ids)))).into(results);
        return results;
    }

    List<String> convertDocsToSongs(List<Document> docs) {
        List<String> songs = new ArrayList<>();

        for ( Document doc : docs) {
            Song s = new Song(doc);
            songs.add(s.toJson());
        }
        return songs;
    }

    List<Document> getFavorites() {

        List<Document> favorites = new ArrayList<>();
        favs.find().sort(new Document("createdAt", 1)).into(favorites);
        List<ObjectId> ids = new ArrayList<>();
        try {
            for (Document favorite : favorites) {
                ids.add(new ObjectId(favorite.getString("songId")));
            }
            return getSongsFromIds(ids);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw e;

        }
    }


    UpdateResult insertFavorites(String id) {
        Document set = new Document("$set", new Document("createdAt", new Date()));
        UpdateOptions options = new UpdateOptions().upsert(true);
        return favs.updateOne(Filters.eq("songId", id), set, options);
    }

    DeleteResult deleteFavorite(String id) {

        return favs.deleteOne(Filters.eq("songId", id));
    }



    void preloadSongsDB(String jsonArray) throws MongoBulkWriteException, JSONException{

            List<Document> docs = new ArrayList<>();

            List<Song> s = new Song().fromJsonArray(jsonArray);
            for(Song _s: s){
                docs.add(_s.toDocument());
            }
            songs.insertMany(docs);


    }

    Boolean isFavorite(String id) {

        return favs.find(new Document("songId", id)).first() != null ? true : false;
    }

    String getLastUpdatedSongDate(){
        Document d = songs.find().sort(new Document("updated_at", -1)).first();
        Song s = new Song(d);
        return s.getUpdated_at().toInstant().toString();
    }
}


