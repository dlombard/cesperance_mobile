import { Navigation } from 'react-native-navigation';

import Drawer from './modules/Drawer';
import HomeScreenContainer from './modules/home/HomeScreenContainer'
import Search from './modules/search/Search'
import SongContainer from './modules/song/SongContainer'
import SongsContainer from './modules/songs/SongsContainer'
import FavoritesContainer from './modules/favorites/FavoritesContainer'
import MenuButton from './modules/MenuButton'
import FavoritesButton from './modules/song/FavoritesButton'
import SearchButton from './modules/home/SearchButton'


export function registerScreens(store, Provider) {
  //Buttons
  Navigation.registerComponent('CustomButton', () => MenuButton);
  Navigation.registerComponent('FavoritesButton', () => FavoritesButton);
  Navigation.registerComponent('SearchButton', () => SearchButton);

  //Screens
  Navigation.registerComponent('cereact.Drawer', () => Drawer, store, Provider)
  Navigation.registerComponent('cereact.Home', () => HomeScreenContainer, store, Provider)
  Navigation.registerComponent('cereact.Search', () => Search, store, Provider)
  Navigation.registerComponent('cereact.Song', () => SongContainer, store, Provider)
  Navigation.registerComponent('cereact.Songs', () => SongsContainer, store, Provider)
  Navigation.registerComponent('cereact.Favorites', () => FavoritesContainer, store, Provider)
}