import 'package:flutter/material.dart';
import 'package:startup_namer/models/Song.dart';
import 'SongDetailScreen.dart';
import 'StitchChannel.dart';
import 'package:startup_namer/models/Book.dart';
import 'App_localizations.dart';
import 'BaseContainer.dart';
import 'NoNetworkAlertDialog.dart';
final StitchChannel stitchChannel = new StitchChannel();

class SongsBase extends StatelessWidget {
  final Book book;
  SongsBase({this.book});

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(text: AppLocalizations.of(context).fr),
      Tab(text: AppLocalizations.of(context).ht),
    ];
    return BaseContainer(
        child: DefaultTabController(
      length: myTabs.length,
      child: new Scaffold(
          appBar: AppBar(
            title: Text(book.name),
            backgroundColor: Colors.transparent,
            bottom: TabBar(tabs: myTabs),
          ),
          backgroundColor: Colors.transparent,
          body: TabBarView(
              children: myTabs.map((Tab t) {
            if (t.text == myTabs.elementAt(0).text)
              return Songs(book: book, language: "fr");
            return Songs(book: book, language: "ht");
          }).toList())),
    ));
  }
}

class Songs extends StatefulWidget {
  const Songs({this.book, this.language});
  final Book book;
  final String language;

  @override
  SongsState createState() => new SongsState();
}

class SongsState extends State<Songs> {
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getSongs(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            return Container(
                decoration: BoxDecoration(color: Colors.white),
                child: _buildSongsList(snapshot));
          } else {
            return new CircularProgressIndicator();
          }
        } if(snapshot.hasError){
          return NoNetworkAlertDialog();
        }else {
          return Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 249, 249, 249)),
              child: Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              )));
        }
      },
    );
  }

  Widget _buildSongsList(AsyncSnapshot snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      itemCount: snapshot.data.length,
      itemBuilder: (context, i) {
        return _buildRow(snapshot.data.elementAt(i));
      },
      separatorBuilder: (context, i) {
        return Divider(color: Colors.blue, height: 5.0);
      },
    );
  }

  Widget _buildRow(Song song) {
    String title = song.num.toString() + ". " + song.title;
    return Container(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: ListTile(
              title: Text(title,
                  style: _biggerFont.copyWith(
                      color: Color.fromARGB(255, 65, 67, 68))),
              onTap: () {
                _pushToSongDetail(song);
              },
            )));
  }

  void _pushToSongDetail(song) {
    Navigator.of(context)
        .push(new MaterialPageRoute<void>(builder: (BuildContext context) {
      return SongDetailScreen(song: song);
    }));
  }

  Future<void> getSongs() async {
    try {
      return await stitchChannel.fetchSongs(widget.book.abbrv, widget.language);
    }catch (e) {
      print(e.message);
     throw e;
    }
  }
}
