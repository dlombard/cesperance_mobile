import 'package:flutter/material.dart';
import 'package:cesperance/models/Song.dart';
import 'Home.dart';
import 'App.dart';
import 'StitchChannel.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:cesperance/App_localizations_delegate.dart';
import 'package:cesperance/onboarding/Onboarding.dart';
import 'LaunchScreen.dart';
import 'dart:async';

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
      theme: new ThemeData(fontFamily: 'Raleway', primarySwatch: Colors.teal, accentColor: Color.fromARGB(255, 28, 70, 106), buttonTheme: ButtonThemeData(buttonColor: Colors.deepOrange)),
      initialRoute: '/',
      routes:{
        '/': (context) => LaunchScreen(),
        '/onboarding': (context) => Onboarding(),
        '/app': (context) => Home()
      }
    );
  }

  Future<List<Song>> getFavorites() async {
    return await stitchChannel.getFavorites();
  }
}
