import 'package:flutter/material.dart';
import 'package:algolia_dart/algolia_dart.dart';
import 'package:startup_namer/models/Song.dart';
import 'SongDetailScreen.dart';
import 'package:startup_namer/App_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'NoNetworkAlertDialog.dart';
class Search extends StatefulWidget {
  final algolia = new Algolia("NHHUYDVI5X", "960f6b92d1edd248c96899d1f0139b51");

  @override
  SearchState createState() => new SearchState();
}

class SearchState extends State<Search> {
  Map<String, dynamic> _results = Map();
  List<Song> _hits = List();
  String text = '';
  Index i;
  bool networkError = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    i = widget.algolia.getIndex("_newCesperance");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return Container(
        decoration:
        BoxDecoration(color: Colors.white, ),
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Column(

          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText:AppLocalizations.of(context).search,),
              maxLines: 1,
              onChanged: (changedText) => searchAlgolia(changedText),

            ),
            Padding(padding: EdgeInsets.all(5.0),child:Align(alignment: Alignment.topLeft,child:Image.asset('assets/search-by-algolia-light-background-99ac347c.png')))
            ,
            Expanded(
                child: _results.containsKey('hits')
                    ? _buildList()
                    : Center(
                  child: Text(AppLocalizations.of(context).noresults),
                ))
          ],
        ));


  }

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      itemCount: _hits.length,
      itemBuilder: (context, i) {
        String title = (_results['hits'] as List).elementAt(i)['_snippetResult']['title']['value'];
        String snippet = (_results['hits'] as List).elementAt(i)['_snippetResult']['lyrics']['value'];
        return _buildRow(_hits.elementAt(i),snippet, title);
      },
      separatorBuilder: (context, i) {
        return Divider(color: Colors.blue, height: 5.0);
      },
    );
  }

  Widget _buildRow(Song song, String snippet, String snippetTitle) {
    String subtitle = song.num.toString() + " " + song.book.name + " " + song.language;
     return Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
        child: InkWell(
            onTap: (){ return _pushToSongDetail(song);},
            child:Column(
          children: <Widget>[
           Html(data:snippetTitle, defaultTextStyle: TextStyle(color: Colors.black87, fontSize: 16.0),),
          Align(alignment: Alignment.centerLeft, child:Text(subtitle, style: TextStyle(fontStyle: FontStyle.italic))),
            Html(data:snippet, defaultTextStyle: TextStyle(color: Color.fromRGBO(0, 0, 255, 1.0), fontSize: 16.0))
          ]
            )));
  }

  void _pushToSongDetail(song) {
    Navigator.of(context)
        .push(new MaterialPageRoute<void>(builder: (BuildContext context) {
      return SongDetailScreen(song: song);
    }));
  }

  Future<void> searchAlgolia(String text) async {
    setState(() {
      text = text;
    });
    if (i == null) i = widget.algolia.getIndex("_newCesperance");
    try{
      Map<String, dynamic> results = await i.search({
        "query": text,
        "hitsPerPage": "50",
      });

      List<Song> hits = (results['hits'] as List)
          .map((json) => Song.fromJSON(json))
          .toList();

      setState(() {
        _results = results;
        _hits = hits;
      });
    } on AlgoliaNetworkException catch (e){
      setState(() {
        networkError = true;
      });
    Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) {return NoNetworkAlertDialog();}));
    }

  }

}
