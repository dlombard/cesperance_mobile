import 'package:flutter/material.dart';
import 'package:cesperance/models/Song.dart';
import 'StitchChannel.dart';
import 'BaseContainer.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:cesperance/commons/Ads.dart';
import 'dart:async';

class SongDetailScreen extends StatefulWidget {
  final Song song;
  SongDetailScreen({this.song});
  @override
  SongDetailState createState() => new SongDetailState();
}

class SongDetailState extends State<SongDetailScreen> {
  BannerAd bannerAd = BannerAd(
      adUnitId: "ca-app-pub-4264401776338564/2947306743",
      targetingInfo: Ads().getTargetingInfo(),
      size: AdSize.banner);
  final StitchChannel _stitchChannel = new StitchChannel();
  double _initialSize;
  double fontSize;
  bool isFavorite = false;
  double _maxFontSize;
  double _minFontSize;
  Icon _favoriteIcon = Icon(
    Icons.favorite_border,
  );
  void initState() {
    _maxFontSize = 24.0;
    _minFontSize = 16.0;
    _initialSize = _minFontSize;
    fontSize = _initialSize;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    checkIsFavorite();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bannerAd
      ..load()
      ..show(anchorOffset: 10, anchorType: AnchorType.bottom);
    return BaseContainer(
        child: new GestureDetector(
            onScaleUpdate: (ScaleUpdateDetails scaleDetails) {
              int temp;
              if (scaleDetails.scale >= 1.0) {
                temp = (_initialSize + scaleDetails.scale * 2.0).toInt();
              } else {
                temp = (_initialSize - 2.0 / scaleDetails.scale).toInt();
              }

              setState(() {
                if (temp >= _maxFontSize) {
                  fontSize = _maxFontSize;
                } else if (temp < _maxFontSize && temp >= _minFontSize) {
                  fontSize = temp.toDouble();
                } else {
                  fontSize = _minFontSize;
                }
              });
            },
            onScaleEnd: (ScaleEndDetails details) {
              setState(() {
                _initialSize = fontSize;
              });
            },
            child: new Scaffold(
                appBar: AppBar(
                    title: Text(widget.song.title),
                    backgroundColor: Colors.transparent,
                    actions: <Widget>[
                      new IconButton(
                        icon: _favoriteIcon,
                        color: Colors.white,
                        onPressed: () {
                          toggleFavorite();
                        },
                      )
                    ]),
                backgroundColor: Colors.transparent,
                body: Column(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                            decoration: BoxDecoration(color: Colors.white, ),
                            child: songHTML(widget.song))),
                  ],
                ))));
  }

 void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    setIsFavorite();
  }

  Future<void> checkIsFavorite() async {
    bool isFav = await _stitchChannel.isFavorite(widget.song.id);
    setState(() {
      isFavorite = isFav;
    });
    setIsFavorite();
  }

  void setIsFavorite() {
    if (isFavorite) {
      setState(() {
        _favoriteIcon = Icon(Icons.favorite);
      });
      _stitchChannel.insertFavorite(widget.song.id);
    } else {
      setState(() {
        _favoriteIcon = Icon(Icons.favorite_border);
      });
      _stitchChannel.deleteFavorite(widget.song.id);
    }
  }

  Widget songHTML(song) {
    return SingleChildScrollView(
      child: Html(
          runAlignment: WrapAlignment.start,
          containerAlignment: Alignment.topCenter,
          defaultTextStyle: TextStyle(fontSize: fontSize),
          data: song.html_lyrics,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),),
    );
  }
}
