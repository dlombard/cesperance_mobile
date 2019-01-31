import 'package:flutter/material.dart';
import 'package:cesperance/models/Song.dart';
import 'SongDetailScreen.dart';
import 'models/State.dart';
import 'utils.dart';

Utils utils = new Utils();

class Favorites extends StatefulWidget {
  @override
  FavoritesState createState() => new FavoritesState();
}

class FavoritesState extends State<Favorites> {
  final _biggerFont = TextStyle(fontSize: 18.0);
  StateModel appState;
  List<Song> favorites = new List();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
        future: utils.getFavorites(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null ) {
              if( snapshot.data.length > 0){
                return Container(
                    decoration:
                    BoxDecoration(color: Color.fromARGB(255, 249, 249, 249)),
                    child: _buildFavoritesList(snapshot));
              } else{
                return Container(
                    decoration: BoxDecoration(color: Color.fromARGB(255, 249, 249, 249)),
                    child: Center(
                      child: Text("No Favorites"),
                    ));
              }

            } else {
              return new CircularProgressIndicator();
            }
          } else{
            return Container(
                decoration: BoxDecoration(color: Color.fromARGB(255, 249, 249, 249)),
                child: Center(
                  child: Text("No Favorites"),
                ));
          }
        });

  }

  Widget _buildFavoritesList(AsyncSnapshot snapshot) {
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
    String subtitle = "${song.book_abbrv} ${song.language}";
    String title = song.num.toString() + ". " + song.title;
    return Container(
        color: Colors.white,
        child: ListTile(
          subtitle: Text(subtitle, style: TextStyle(fontStyle: FontStyle.italic)),
          title: Text(title,
              style:
                  _biggerFont.copyWith(color: Color.fromARGB(255, 65, 67, 68))),
          onTap: () {
            _pushToSongDetail(song);
          },
        ));
  }

  void _pushToSongDetail(song) {
    Navigator.of(context)
        .push(new MaterialPageRoute<void>(builder: (BuildContext context) {
      return new SongDetailScreen(song: song);
    }));
  }


}
