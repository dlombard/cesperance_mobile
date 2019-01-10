import 'package:flutter/material.dart';
import 'package:startup_namer/models/Song.dart';
import 'StitchChannel.dart';
import 'App.dart';
import 'utils.dart';
import 'BaseContainer.dart';

class SongDetailScreen extends StatefulWidget {
  final Song song;
  SongDetailScreen({this.song});
  @override
  SongDetailState createState() => new SongDetailState();
}

class SongDetailState extends State<SongDetailScreen> {
  final StitchChannel _stitchChannel = new StitchChannel();

  bool isFavorite;
  String _deviceId;
  dynamic container;
  void initState(){
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      container = AppStateWidget.of(context);
    });
    checkIsFavorite(container);
  }

  @override
  Widget build(BuildContext context) {

    _deviceId = container.state.deviceId;

    return BaseContainer(
        child: new Scaffold(
            appBar: AppBar(
                title: Text(widget.song.title),
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  new IconButton(
                    icon: (isFavorite
                        ? Icon(
                            Icons.favorite,
                          )
                        : Icon(
                            Icons.favorite_border,
                          )),
                    color: Colors.white,
                    onPressed: () {
                      toggleFavorite(container);
                    },
                  )
                ]),
            backgroundColor: Colors.transparent,
            body: songDetail(widget.song)));
  }

  Widget songDetail(song) {
    final Utils utils = Utils();
    List<String> splittedLyrics = widget.song.mdlyrics.html.replaceAll("&#39;", "'").split("\n");
    return new Container(
        color: Colors.white,
        child:ListView.builder(
            itemCount: splittedLyrics.length,
            itemBuilder: (context, i){
          return utils.toText(splittedLyrics[i]);
        })
          );
  }

 void toggleFavorite(AppState container) {
    setState(() {
      isFavorite = !isFavorite;
    });
    if (isFavorite) {
       _stitchChannel.insertFavorite(_deviceId, widget.song.id);
    } else {
       _stitchChannel.deleteFavorite(_deviceId, widget.song.id);
    }

  }

  void checkIsFavorite(AppState container) {
    List<Song> currentFavs = container.state.favorites;

    for (Song s in currentFavs) {
      if (s.id == widget.song.id) {
        setState(() {
          isFavorite = true;
        });
        return;
      }
    }
  if(isFavorite != true){
      setState(() {
        isFavorite = false;
      });
  }
  }
}
