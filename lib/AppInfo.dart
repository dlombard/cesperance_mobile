import 'package:flutter/material.dart';
import 'BaseContainer.dart';
import 'package:url_launcher/url_launcher.dart';

class AppInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseContainer(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
                        child: Text(
                          "Le Chant d'Espérance",
                          style: TextStyle(fontSize: 24.0, color: Colors.white),
                        )),
                    Text('Version 3.0.0',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white70,
                            fontStyle: FontStyle.italic)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: InkWell(
                            onTap: _launchURL,
                            child: Image.asset(
                              'assets/android/Icon.png',
                              width: 80,
                              height: 80,
                            )))
                  ],
                ))));
  }

  _launchURL() async {
    const url = 'https://lechantdesperance.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
