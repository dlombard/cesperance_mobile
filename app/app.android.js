/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */

import React from 'react';
import { registerScreens } from './screens';
import {
  Platform,
  StyleSheet,
  Text,
  View
} from 'react-native';
import { Navigation } from 'react-native-navigation'
import { Provider } from 'react-redux';
import configureStore from './store'
import { persistStore } from 'redux-persist'
import { navigatorStyle } from './styles/styles'

const store = configureStore()

export default () => {

  persistStore(store, null, () => {
    registerScreens(store, Provider)

    Navigation.startSingleScreenApp({
      screen: {
        screen: 'cereact.Home',
        title: `Chant d'Espérance`,
        navigatorStyle,
        leftButtons: [
          {
            id: 'sideMenu'
          }
        ]
      },
      drawer: {
        left: {
          screen: 'cereact.Drawer'
        }
      }
    });
  })
}