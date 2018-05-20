// @flow
'use strict'

import React, { PureComponent } from 'react'
import { View, Text, TextInput, StyleSheet, Image, NetInfo } from 'react-native'
import SearchList from './SearchList'
const algoliasearch = require('algoliasearch/reactnative')('NHHUYDVI5X', '3ea876b1f721606adb66a7288662b4fe')
var index = algoliasearch.initIndex('cesperance')
const AlgoliaSearchHelper = require('algoliasearch-helper')
import I18n from '../../utils/Translations'
import { navigatorStyle } from '../../styles/styles'

export default class SearchScreen extends PureComponent {

  constructor(props) {
    super(props)
    this.state = {
      text: '',
      helper: index,
      hits: [],
      resultsLoaded: false,
      results: [],
      isConnected: false
    }
  }

  componentDidMount() {
    NetInfo.isConnected.addEventListener(
      'connectionChange',
      this._handleConnectivityChange
    );
    NetInfo.isConnected.fetch().done(
      (isConnected) => { this.setState({ isConnected }) }
    );

  }
  componentWillUnmount() {
    NetInfo.isConnected.removeEventListener(
      'connectionChange',
      this._handleConnectivityChange
    )
  }
  componentWillMount() {

  }

  _handleConnectivityChange = (connectionInfo) => {
    if (connectionInfo.ConnectionType == 'none' || connectionInfo.ConnectionType == 'unknown') {
      this.setState({
        isConnected: false
      })
    } else {
      this.setState({
        isConnected: true,
      })
    }

  }

  _onSelectedSong = (song) => {

    this.props.navigator.push({
      screen: "cereact.Song",
      title: `${song.num}. ${song.title}`,
      passProps: { song },
      navigatorStyle
    })
  }
  search = (text) => {
    index.search({ query: text, hitsPerPage: 60, highlightPreTag: '**', highlightPostTag: '**' }, (err, result) => {
      if (err) {
        console.error(err)
      }
      else {

        this.setState({
          hits: result.hits,
          resultsLoaded: true,
          results: result
        })
      }
    })
  }
  render() {

    const titleConfig = {
      title: I18n.t('search'),
      tintColor: 'white'
    }
    if (this.state.isConnected) {
      return (

        <View style={{ flex: 1, margin: 10 }}>
          <TextInput
            style={{ height: 40, borderColor: '#354ABB', borderWidth: 1, borderRadius: 1, marginBottom: 10 }}
            onChangeText={this.search}
            placeholder='search'
            returnKeyType='search'
            multiline={false}
            maxLength={30}
            autoCorrect={false}>
          </TextInput>
          <View style={styles.algolia}>
            <Text > poweredBy </Text>
            <Image style={styles.algoliaIcon} source={require('../../res/img/Algolia_logo_bg-white.png')} />
          </View>
          <View style={{ paddingTop: 10 }}>
            <SearchList
              data={this.state.hits}
              onSelectedSong={this._onSelectedSong} />
          </View>
        </View>
      )
    }
    else {
      return (
        <View >
          <View style={{ flex: 1, alignItems: "stretch", flexDirection: "column", justifyContent: 'center' }}>
            <Text style={{ alignSelf: 'center', textAlign: 'center' }}> {`No connectivity. \n Please check your connection to use the search feature`}</Text>
          </View>
        </View>
      )
    }
  }
}
const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'flex-start',
    margin: 5
  },
  text: {
    fontSize: 8,
    color: 'black'
  },
  title: {
    textAlign: 'left',
    color: '#5c5c5c',
    marginLeft: 10,
    borderColor: '#ccc',
    width: 270,
    fontSize: 12,
    marginBottom: 2

  },
  highlighted: {
    color: 'blue',
    fontWeight: '500'
  },
  algolia: {
    justifyContent: 'flex-start',
    flexDirection: 'row',
  },
  algoliaIcon: {
    width: 39,
    height: 12
  }
})