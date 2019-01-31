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
      'messageValidate':' Please enter your message',
      'newDesign': 'New Design',
      'newDesignDescription': "Easy to use the 7 included books",
      "searchOnboarding": 'Advanced Search',
      "searchOnboardingDescription": "Thanks to the search engine, you can easily find the song you look for",
      "suggestionsOnboarding":"Have Suggestions?",
      "suggestionsOnboardingDescription": "You would like to see a new feature or improvement? Fill the contact us form!",
      "instantUpdates":"Song updates",
      "instantUpdatesDescription":"Songs are corrected through are online service and updated on your device!",
      "searchInstructions": "Type the words you are looking for in the search bar"
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
      'messageValidate':' Veuillez composer votre message',
      'newDesign': 'Interface Amélioré',
      'newDesignDescription': "Facilite l'utilisation des 7 livres de chants",
      "searchOnboarding": 'Recherche Avancée',
      "searchOnboardingDescription": "Trouvez facilement le chant que vous voulez grâce au puissant moteur de recherche",
      "suggestionsOnboarding":"Vous avez des suggestions?",
      "suggestionsOnboardingDescription": "Vous avez des idées pour l'application? Remplissez le formulaire de contact!",
      "instantUpdates":"Mise à jour des chants ",
      "instantUpdatesDescription":"Les corrections seront mise à jour directement sur votre appareil!",
      "searchInstructions": "Tappez les paroles que vous recherchez dans la barre de recherche"

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
  /*
        'newDesign': 'New Design',
      'newDesignDescription': "Easy to use the 7 included books",
      "searchOnboarding": 'Advance Search',
      "searchOnboardingDescription": "Thanks to the search engine, you can easily find the song you look for",
      "suggestionsOnboarding":"Have Suggestions?",
      "suggestionsOnboardingDescription": "You would like to see a new feature or improvement? Fill the contact us form!",
      "instantUpdates":"Song updates",
      "instantUpdatesDescription":
   */

  String get newDesign{
    return _localizedValues[locale.languageCode]['newDesign'];
  }
  String get newDesignDescription {
    return _localizedValues[locale.languageCode]['newDesignDescription'];
  }
  String get searchOnboarding {
    return _localizedValues[locale.languageCode]['searchOnboarding'];
  }
  String get searchOnboardingDescription {
    return _localizedValues[locale.languageCode]['searchOnboardingDescription'];
  }
  String get suggestionsOnboarding {
    return _localizedValues[locale.languageCode]['suggestionsOnboarding'];
  }
  String get suggestionsOnboardingDescription{
    return _localizedValues[locale.languageCode]['suggestionsOnboardingDescription'];
  }
  String get instantUpdates{
    return _localizedValues[locale.languageCode]['instantUpdates'];
  }
  String get instantUpdatesDescription{
    return _localizedValues[locale.languageCode]['instantUpdatesDescription'];
  }
  String get searchInstructions{
    return _localizedValues[locale.languageCode]['searchInstructions'];
  }

}