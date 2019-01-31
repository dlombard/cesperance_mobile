import 'package:flutter/material.dart';
import 'package:cesperance/StitchChannel.dart';
import 'services/CeGrpcService.dart';
import 'models/Song.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
final String assetName = 'assets/ce-text.svg';

class LaunchScreen extends StatefulWidget {
  @override
  LaunchScreenState createState() => new LaunchScreenState();
}

class LaunchScreenState extends State<LaunchScreen> {
  StitchChannel _stitchChannel = new StitchChannel();
  Map<String, String> state = {};
  String currentState = "Starting App";
  final Widget svg = new SvgPicture.asset(assetName, height: 81, width: 200);
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    initApp();
    return Scaffold(
        body: Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: svg),
            new CircularProgressIndicator(),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(
                currentState,
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
    ));
  }

  Future<void> initApp() async {
    try {
      var r = await _stitchChannel.getPlatform().invokeMethod("initStitch");

      Map<dynamic, dynamic> onboardedState = await _stitchChannel.getLocalData(
          id: "onboarding") as Map<dynamic, dynamic>;
      Map<dynamic, dynamic> songState = await _stitchChannel.getLocalData(
          id: "songsState") as Map<dynamic, dynamic>;

      if (songState["songsPreloaded"] == false) {
        await importSongsToDB();
      }

      fetchLastUpdatedSongs();

      if (onboardedState["onboardingDone"] == false) {
        Navigator.pushReplacementNamed(context, "/onboarding");
      } else {
        Navigator.pushReplacementNamed(context, "/app");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> importSongsToDB() async {
    try {
      Map<dynamic, dynamic> songState = await _stitchChannel.getLocalData(
          id: "songsState") as Map<dynamic, dynamic>;
      if (songState["songsPreloaded"] == false) {
        String data = await DefaultAssetBundle.of(context)
            .loadString("assets/songs.json");
        setState(() {
          currentState = "Loading songs to DB";
        });
        await _stitchChannel.preloadSongs(data);
        _stitchChannel.setSongsPreloaded(true);
      }
    } catch (e) {
      setState(() {
        currentState = e.toString();
      });
      print(e.toString());
    }
  }

  Future<void> fetchLastUpdatedSongs() async {
    try {
      var date = await _stitchChannel.getLastUpdatedSongDate();
      var call = CeGrpcService().getSongsUpdatedSince(DateTime.parse(date));

      call.listen((songReply) {
         String createdAt =
            DateTime.fromMillisecondsSinceEpoch(songReply.createdAt.toInt())
                .toUtc()
                .toIso8601String();
        final String updatedAt =
            DateTime.fromMillisecondsSinceEpoch(songReply.updatedAt.toInt())
                .toUtc()
                .toIso8601String();

        Song song = new Song(
            songReply.iD,
            songReply.title,
            songReply.num,
            songReply.language,
            songReply.markdownLyrics,
            songReply.htmlLyrics,
            songReply.bookAbbrv,
            createdAt,
            updatedAt);
        _stitchChannel.updateSong(song);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
