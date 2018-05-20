/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React from 'react';
import { registerScreens } from './screens';
import Icon from 'react-native-vector-icons/Ionicons';
import {
  Platform,
  StyleSheet,
  Text,
  View,
  TouchableOpacity
} from 'react-native';
import { Navigation } from 'react-native-navigation'
import { Provider } from 'react-redux';
import configureStore from './store'
import { persistStore } from 'redux-persist'

const store = configureStore()


const navigatorStyle = {
  statusBarColor: 'black',
  statusBarTextColorScheme: 'light',
  navigationBarColor: 'black',
  navBarBackgroundColor: '#354ABB',
  navBarTextColor: 'white',
  navBarButtonColor: 'white',
  tabBarButtonColor: 'red',
  tabBarSelectedButtonColor: 'red',
  tabBarBackgroundColor: 'white',
  topBarElevationShadowEnabled: false,
  navBarHideOnScroll: true,
  tabBarHidden: true,
  drawUnderTabBar: true
};




export default () => {

  persistStore(store, null, () => {
    registerScreens(store, Provider)

    Navigation.startSingleScreenApp({
      screen: {
        screen: 'cereact.Home',
        title: `Chant d'Esperance`,
        navigatorStyle
      },
      drawer: {
        left: {
          screen: 'cereact.Drawer',
        },
      }
    });
  })

}