import 'package:flutter/material.dart';
import 'package:startup_namer/models/Song.dart';
import 'SongDetailScreen.dart';
import 'models/State.dart';
import 'App.dart';

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
    final AppState state = AppStateWidget.of(context);
    favorites = state.favorites;

    if (favorites != null) {
      if (favorites.length > 0) {
        return Container(
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 249, 249, 249)),
            child: _buildFavoritesList(favorites));
      } else {
        return Center(
          child: Text("No Favorites"),
        );
      }
    } else {
      return Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 249, 249, 249)),
          child: Center(
            child: Text("No Favorites"),
          ));
    }
  }

  Widget _buildFavoritesList(List<Song> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(5, 10, 5, 0),
      itemCount: snapshot.length,
      itemBuilder: (context, i) {
        return _buildRow(snapshot.elementAt(i));
      },
      separatorBuilder: (context, i) {
        return Divider(color: Colors.blue, height: 5.0);
      },
    );
  }

  Widget _buildRow(Song song) {
    String subtitle = "${song.book.name} ${song.language}";
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
