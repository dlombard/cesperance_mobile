'use strict'

import React, { Component } from 'react'

import {
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  Text,
  View
} from 'react-native'

import _ from 'lodash'
import Icon from 'react-native-vector-icons/FontAwesome'
import I18n from '../../utils/Translations'
import * as Tools from '../../utils/Tools'
import { navigatorStyle } from '../../styles/styles'
import HTML from 'react-native-render-html';

export default class SongScreen extends Component {
  constructor(props) {
    super(props)
    this.state = {
      song: props.song,
      isFavorite: props.isFavorite,
      lyrics: Tools.htmlToJSX(props.song.lyrics_Markdown.html),
      starName: 'ios-heart-outline',
      disabled: true
    }
    console.log(this.props.navigator)
    this.props.navigator.setButtons({
      rightButtons: [{
        component: 'FavoritesButton',
        id: 'favs',
        showAsAction: 'always',
        passProps: {
          setFavorite: this._updateFavorite,
          icon: this.props.icon
        }
      }
      ]
    });
  }
  componentDidMount() {
    Icon.getImageSource(this.props.icon, 20, 'red').then((source) => this.setState({ userIcon: source }));
  }

  componentWillUnmount() {

  }
  _onSongChanged = () => {

  }
  componentWillReceiveProps(nextProps) {

    nextProps.navigator.setButtons({
      rightButtons: [{
        component: 'FavoritesButton',
        id: 'favs',
        passProps: {
          setFavorite: this._updateFavorite,
          icon: nextProps.icon,
        }
      }
      ]
    });

  }
  _updateFavorite = () => {
    this.props.actions.setFavorite(this.props.isFavorite)
  }
  componentDidMount() {

  }
  componentWillUpdate() {
  }
  _updateFav() {

  }
  _share = () => {
  }
  render() {

    const titleConfig = {
      title: `${this.state.song.num}. ${this.state.song.title}`,
      tintColor: 'black'
    }


    const statusBarConfig = {
      tintColor: '#2d3e9f',
      style: 'light-content',
    }

    return (
      <View style={{ backgroundColor: 'white', flex: 1 }}>
        <ScrollView contentContainerStyle={styles.container}
          maximumZoomScale={2.0} >
          <HTML html={this.state.lyrics} tagsStyles={{ p: { textAlign: 'center', fontSize: 17, color: '#070707' }, strong: { fontWeight: '600', fontSize: 17 } }} />
          <View style={{ height: 10 }}>
          </View>
        </ScrollView>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    marginTop: 50,
    margin: 20,
    alignItems: 'center',
  },
  lyrics: {

  },
  footer: {
    backgroundColor: '#354ABB',
    height: 40,
    alignItems: 'center',
    justifyContent: 'center'
  },
  toolbar: {
    backgroundColor: '#354ABB',
  },
})