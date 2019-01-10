import 'package:flutter/material.dart';

class NoNetworkAlertDialog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(title: Text("Error"), content:  SingleChildScrollView(child:Row(children: <Widget>[Expanded(child:Icon(Icons.wifi_lock)), Expanded(child:Text('Seems like your are not connected to the internet!'))])),actions: <Widget>[
      FlatButton(
        child: Text('Ok'),
        onPressed: () {
          Navigator.of(context).pop();

        },
      ),
    ],);
  }
}