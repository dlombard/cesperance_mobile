import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:cesperance/models/Song.dart';
import 'dart:async';

class StitchChannel {
  static const platform = const MethodChannel('ce.dlo.io/Stitch');

  StitchChannel();

  MethodChannel getPlatform(){
    return platform;
  }
  Future<void> preloadSongs(dynamic jsonData) async {
    try {
   await platform
          .invokeMethod('preloadSongs', <String, dynamic>{'songs': jsonData});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> getStitchUserId() async {
    final userId = await platform.invokeMethod('getUserId', "yo");
    return userId;
  }

  Future<List<Song>> getSongs(String book, String lang) async {
    try {
      final List<dynamic> docs = await platform.invokeMethod(
          "getSongs", <String, dynamic>{'book': book, 'lang': lang});

      return docsToSongs(docs);
    }catch(e){
      throw e.toString();
    }
  }

  Future<bool> insertFavorite(String id) async {
    bool result;
    try{
          result = await platform.invokeMethod("insertFavorite", <String, dynamic>{'id': id});
      return result;
    }catch(e){
      print(e.toString());
    }
return result;

  }

  Future<bool> deleteFavorite(String id) async {
    bool result = await platform
        .invokeMethod("deleteFavorite", <String, dynamic>{'id': id});
    return result;
  }

  Future<List<Song>> getFavorites() async {
    List<dynamic> docs = List<dynamic>();
    try {
      docs = await platform.invokeMethod("getFavorites", <String, dynamic>{});
    } catch (e) {
      print(e.toString());
    }
    return docsToSongs(docs);
  }

  List<Song> docsToSongs(List<dynamic> docs) {
    List<Song> u = new List<Song>();
    docs.asMap().forEach((i, s) {
      Map songsMap = json.decode(s);
      u.add(Song.fromJSON(songsMap));
    });
    return u;
  }

  Future<String> getLastUpdatedSongDate() async {
    String r;
    try {
      r =  await platform.invokeMethod("getLastUpdatedSongDate");

    } catch (e) {
      print(e.toString());
    }
    return r;
  }

  Future<dynamic> getLocalData({String id}) async {
    try {
      if (id == null) {
        List<String> results = await platform.invokeMethod("getLocalData");
        List<dynamic>r = [];
        results.forEach((String s){ r.add(jsonDecode(s));});
        return r;
      } else {
        String result = await platform
            .invokeMethod("getLocalData", <String, dynamic>{'id': id});

        return jsonDecode(result);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> setOnboarding(bool value) async {
    try {
      await platform
          .invokeMethod("setOnboarding", <String, bool>{"value": value});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> setSongsPreloaded(bool value) async {
    try {
      await platform
          .invokeMethod("songsPreloaded", <String, bool>{"value": value});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> isFavorite(String id) async {
    bool isCompleted;
    try {
      isCompleted = await platform
          .invokeMethod("isFavorite", <String, String>{"id": id});
    } catch (e) {
      print(e.toString());
      return false;
    }
    return isCompleted;
  }

  Future<void> updateSong(Song song) async {

    try{
      await platform.invokeMethod("updateSong", <String, dynamic>{"song": json.encode(song.toJson())});
    }catch(e){
      print(e.toString());
    }
  }
}
