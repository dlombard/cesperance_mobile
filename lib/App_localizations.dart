import 'package:flutter/material.dart';

class AppLocalizations{
  AppLocalizations(this.locale);
  final Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'search': 'Search',
      'fr': 'French',
      'ht': 'Creole',
      'noresults': 'Nothing Found',
      'favorites': 'Favorites',
      'help': 'Help',
      'contactUs': 'Contact Us',
      'privacy': 'Privacy Policy',
      'appInfo': 'App Info',
      'home': 'Home',
      'name': 'Name',
      'email': 'Email',
      'message': 'Message',
      'send':'Send',
      'emailValidate': 'Please enter your email',
      'messageValidate':' Please enter your message'

    },
    'fr': {
      'search': 'Recherchez',
      'fr': 'Français',
      'ht': 'Créole',
      'noresults': 'Aucun chant ne corresponds à la recherche',
      'favorites': 'Favoris',
      'help': 'Aide',
      'contactUs': 'Contactez-Nous',
      'privacy': 'Vie Privée',
      'appInfo': 'À Propos',
      'home': 'Accueil',
      'name': 'Nom',
      'email': 'Courriel',
      'message': 'Message',
      'send': 'Envoyer',
      'emailValidate': 'Veuillez entrer votre addresse courriel'
      ,
      'messageValidate':' Veuillez composer votre message'
    },
  };

  String get search {
    return _localizedValues[locale.languageCode]['search'];
  }

  String get fr {
    return _localizedValues[locale.languageCode]['fr'];
  }

  String get ht {
    return _localizedValues[locale.languageCode]['ht'];
  }

  String get noresults {
    return _localizedValues[locale.languageCode]['noresults'];
  }

  String get favorites {
    return _localizedValues[locale.languageCode]['favorites'];
  }

  String get help {
    return _localizedValues[locale.languageCode]['help'];
  }

  String get contactUs {
    return _localizedValues[locale.languageCode]['contactUs'];
  }

  String get privacy {
    return _localizedValues[locale.languageCode]['privacy'];
  }

  String get appInfo {
    return _localizedValues[locale.languageCode]['appInfo'];
  }

  String get home {
    return _localizedValues[locale.languageCode]['home'];
  }

  String get name{
    return _localizedValues[locale.languageCode]['name'];
  }

  String get email{
    return _localizedValues[locale.languageCode]['email'];
  }

  String get message{
    return _localizedValues[locale.languageCode]['message'];
  }

  String get send{
    return _localizedValues[locale.languageCode]['send'];
  }

  String get emailValidate{
    return _localizedValues[locale.languageCode]['emailValidate'];
  }


  String get messageValidate{
    return _localizedValues[locale.languageCode]['messageValidate'];
  }

}