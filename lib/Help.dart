import 'package:flutter/material.dart';
import 'App_localizations.dart';
import 'ContactUs.dart';
import 'AppInfo.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<dynamic> items = [
     // {"title": AppLocalizations.of(context).contactUs, "view": new ContactUs()},
      {"title": AppLocalizations.of(context).privacy, "view": new ContactUs()},
      {"title": AppLocalizations.of(context).appInfo, "view": new AppInfo()}
    ];

    return Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          center: Alignment.centerLeft,
          radius: 3,
          stops: [
            0.1,
            0.5,
          ],
          colors: [
            const Color.fromRGBO(28, 86, 231, 100),
            const Color.fromRGBO(70, 222, 249, 100)
          ],
        )),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Help'),
              backgroundColor: Colors.transparent,
            ),
            backgroundColor: Colors.transparent,
            body: Container(
                decoration: BoxDecoration(color: Colors.white),
                padding: EdgeInsets.all(5.0),
                child: ListView.separated(
                  itemBuilder: (context, i) {
                    return Container(
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                            items.elementAt(i)['title'],
                          ),
                          onTap: () {
                            if(items.elementAt(i)['title'] != AppLocalizations.of(context).privacy)
                            Navigator.of(context).push(
                                new MaterialPageRoute<void>(
                                    builder: (BuildContext context) {
                                      return  items.elementAt(i)['view'];
                                    }));

                            else
                              return _launchURL();
                          },
                        ));
                  },
                  separatorBuilder: (context, i) {
                    return Divider(color: Colors.black87, height: 5.0);
                  },
                  itemCount: items.length,
                ))));
  }

  _launchURL() async {
    const url = 'https://sites.google.com/dlombard.net/lechantdespranceapp/home';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
