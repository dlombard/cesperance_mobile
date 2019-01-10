import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:startup_namer/models/Song.dart';
import 'package:http/http.dart' as http;

class StitchChannel {
  static const platform = const MethodChannel('ce.dlo.io/Stitch');

  StitchChannel(){
    /*platform.setMethodCallHandler((MethodCall call){
      print("PLATFORM . SET METHOD");
      switch(call.method){
        case "reloadFavorites":
          print("RELAOD FAVORITES");
          break;
        default:
          print("RECEIVED MESSAGE FROM JAVA CODE");
          break;
      }
    });*/
  }

  Future<String> getStitchUserId() async {
    final userId = await platform.invokeMethod('getUserId', "yo");
    return userId;
  }

  Future<List<Song>> getSongs(String book, String lang) async {
    final List<dynamic> docs = await platform.invokeMethod(
        "getSongs", <String, dynamic>{'book': book, 'lang': lang});
    return docsToSongs(docs);
  }

  Future<bool> insertFavorite(String deviceId, String id) async {
    bool result = await platform.invokeMethod(
        "insertFavorite", <String, dynamic>{"deviceId": deviceId, 'id': id});
    return result;
  }

  Future<bool> deleteFavorite(String deviceId, String id) async {
    bool result = await platform.invokeMethod(
        "deleteFavorite", <String, dynamic>{"deviceId": deviceId, 'id': id});
    return result;
  }

  Future<List<Song>> getFavorites(String deviceId) async {
    final List<dynamic> docs = await platform
        .invokeMethod("getFavorites", <String, dynamic>{"deviceId": deviceId});
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
  Future<List<Song>> fetchSongs(String book, String lang) async {

    String url = "https://api.cesperance.com/v2/songs?book="+book+"&language="+lang;
    try{
      final response =
      await http.get(url);

      if (response.statusCode == 200) {

        final List<dynamic> docs = json.decode(response.body);
        final List<Song> songs = docs.map((m) => new Song.fromJSON(m)).toList();
        print(songs.elementAt(0).mdlyrics.html);
        return songs;
        //List<Song> u = new List<Song>();

        // If server returns an OK response, parse the JSON
        //return docsToSongs(docs);
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load post');
      }
    }catch(e){
      print(e.toString());
      throw Exception("Network Error");
    }

  }
}
