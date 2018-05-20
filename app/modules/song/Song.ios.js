'use strict'

import React, { Component } from 'react'

import {
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  Text,
  View,
  WebView
} from 'react-native'

import _ from 'lodash'
import Icon from 'react-native-vector-icons/FontAwesome'
import I18n from '../../utils/Translations'
import * as Tools from '../../utils/Tools'
import { navigatorStyle } from '../../styles/styles'
import HTML from 'react-native-render-html';
import { MarkdownView } from 'react-native-markdown-view'

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

    this.props.navigator.setButtons({
      rightButtons: [{
        component: 'FavoritesButton',
        id: 'favs',
        passProps: {
          setFavorite: this._updateFavorite,
          icon: this.props.icon
        }
      }
      ]
    });
  }
  componentWillMount() {

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
  _share = () => {
  }
  render() {

    const titleConfig = {
      title: `${this.state.song.num}. ${this.state.song.title}`,
      tintColor: 'white'
    }


    const statusBarConfig = {
      tintColor: '#2d3e9f',
      style: 'light-content',
    }

    return (
      <ScrollView contentContainerStyle={styles.container}
        maximumZoomScale={2.0} >
        <HTML html={this.state.lyrics} tagsStyles={{ p: { textAlign: 'center', fontSize: 17, color: '#070707' }, strong: { fontWeight: '600', fontSize: 17 } }} />
        <View style={{ height: 10 }}>
        </View>
      </ScrollView>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    marginTop: 76,
    margin: 20,
    alignItems: 'center',
    justifyContent: 'center'
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

const mdStyle = {
  paragraph: {
    fontSize: 15, color: '#070707'
  },
  strong: {
    fontWeight: '700',
    fontSize: 16
  }
}