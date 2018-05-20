// @flow
'use strict'

import React, { PureComponent } from 'react'
import { View, Text, TextInput, FlatList, StyleSheet, Image, NetInfo, BackHandler } from 'react-native'
import SearchListItem from './SearchListItem'
import I18n from '../../utils/Translations'

export default class SearchScreen extends PureComponent {

  constructor(props) {
    super(props)
  }
  _keyExtractor = (item, index) => item._id.$oid;

  render() {
    const titleConfig = {
      title: I18n.t('search'),
      tintColor: 'white'
    }
    return (
      <FlatList
        data={this.props.data}
        extraData={this.state}
        keyExtractor={this._keyExtractor}
        renderItem={this._renderSong} />
    )
  }


  renderSeparator = () => {
    return (
      <View>
      </View>
    )
  }
  _renderSong = ({ item }) => {
    console.log(item)
    return (
      <SearchListItem
        handler={(event) => this.props.onSelectedSong(item)}
        song={item}
        key={item._id.$oid + item.num}>
      </SearchListItem>
    );
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