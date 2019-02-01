import 'package:flutter/material.dart';

import 'StitchChannel.dart';
import 'DCard.dart';
import 'Songslist.dart';
import 'package:cesperance/models/Book.dart';

class Booklist extends StatefulWidget {
  @override
  MyListState createState() => new MyListState();
}

class MyListState extends State<Booklist> {
  final StitchChannel stitchChannel = new StitchChannel();

  final _books = <Book>[
    new Book(name: "Chant d'Espérance", abbrv: "CE"),
    new Book(name: "Mélodies Joyeuses", abbrv: "MJ"),
    new Book(name: "La Voix du Réveil", abbrv: "VR"),
    new Book(name: "Réveillons-Nous", abbrv: "RN"),
    new Book(name: "Échos des Élus", abbrv: "EE"),
    new Book(name: "Haïti Chante avec Radio Lumière", abbrv: "HC"),
    new Book(name: "Gloire à l'Agneau", abbrv: "GA"),
    new Book(name: "L'Ombre du Réveil", abbrv: "OR"),
    new Book(name: "Réveillons-Nous Chrétiens", abbrv: "RNC"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Color.fromARGB(255, 249, 249, 249)),
        child: _buildList(context));
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
      itemBuilder: (context, i) {
        if (i < _books.length) return _buildRow(_books[i]);
      },
    );
  }

  Widget _buildRow(Book book) {
    return DCard(
        margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
        height: 65,
        boxDecoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(2.0),
            ),
            boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1.0)]),
        text: Text(
          book.name,
          style: TextStyle(
              color: Color.fromARGB(255, 65, 67, 68),
              fontSize: 18),
        ),
        onTap: () {
          return _pushToSongs(book);
        });
  }

  void _pushToSongs(book) {
    Navigator.of(context)
        .push(new MaterialPageRoute<void>(builder: (BuildContext context) {
      return SongsBase(book: book);
    }));
  }

}
