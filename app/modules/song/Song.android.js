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

export default class SongScreen extends Component {
  constructor(props) {
    super(props)
    this.state = {
      song: this.props.song,
      isFavorite: this.props.isFavorite,
      lyrics: Tools.lyricsToJSX(this.props.song.lyrics),
      starName: 'ios-star-outline',
      disabled: true
    }
  }
  componentWillMount() {

  }

  componentWillUnmount() {

  }
  _onSongChanged = () => {

  }

  _onAddedToFavs = () => {
    this.setState({
      starName: 'favorite'
    })
  }
  _onRemovedFromFavs = () => {
    this.setState({
      starName: 'favorite_border'
    })
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
      tintColor: 'white'
    }


    const statusBarConfig = {
      tintColor: '#2d3e9f',
      style: 'light-content',
    }

    return (
      <View>
        <ScrollView contentContainerStyle={styles.container}
          maximumZoomScale={2.0} >
            {this.state.lyrics}
          <View style={{ height: 10 }}>
          </View>
        </ScrollView>
        <Icon.ToolbarAndroid
          title={`${this.state.song.num}. ${this.state.song.title}`}
          style={styles.toolbar}
          actions={[{
            iconName: 'star',
            title: `${I18n.t('favorites')}`,
            onPress: this._updateFav(),
            disabled: this.state.disabled
          }, {
            navIconName: 'share',
            title: `${I18n.t('share')}`,
            onActionSelected: console.log('HI')
          }]}
        >
        </Icon.ToolbarAndroid>
      </View>
    )
  }
}

const styles = StyleSheet.create({
  container: {
    marginTop: 76,
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