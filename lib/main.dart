import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:startup_namer/models/Song.dart';
import 'Home.dart';
import 'App.dart';
import 'StitchChannel.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:startup_namer/App_localizations_delegate.dart';

void main() => runApp(AppStateWidget(child:MyApp()));

class MyApp extends StatelessWidget {
  final StitchChannel stitchChannel = new StitchChannel();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('fr')
      ],
      title: "Le Chant d'Espérance",
      theme: new ThemeData(fontFamily: 'Raleway', primarySwatch: Colors.teal, accentColor: Colors.teal, buttonTheme: ButtonThemeData(buttonColor: Colors.deepOrange)),
      home: Home()
    );
  }

  Future<List<Song>> getFavorites() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    return await stitchChannel.getFavorites(androidInfo.androidId);
  }
}
