import I18n from 'react-native-i18n'

I18n.fallbacks = true;

I18n.translations = {
    en: {
        greeting: 'Hi!',
        search: 'Search',
        favorites: 'Favorites',
        about: 'About Us',
        settings: 'Settings',
        poweredBy: 'Powered by',
        filter: 'Filter',
        fr: 'French',
        ht: 'Kreyol',
        home: 'Home',
        share:'Share',
        downloading:'Downloading song library'
    },
    fr: {
        greeting: 'Bonjour!',
        search: 'Recherche',
        favorites: 'Favoris',
        about: 'À Propos',
        settings: 'Paramètres',
        poweredBy: 'Propulsé par',
        filter: 'Filtrez',
        fr: 'Français',
        ht: 'Créole',
        home:' Accueil',
        share:'Partagez',
        downloading:'Téléchargement des chants'
    }
}

module.exports = I18n