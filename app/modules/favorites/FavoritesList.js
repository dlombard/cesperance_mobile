// @flow
'use strict'

import React, { PureComponent } from 'react'
import { View, Text, TextInput, FlatList, StyleSheet, Image, NetInfo, BackHandler } from 'react-native'
import FavoritesListItem from './FavoritesListItem'
import I18n from '../../utils/Translations'
import _ from 'lodash'
export default class FavoritesList extends PureComponent {

  constructor(props) {
    super(props)
  }
  _keyExtractor = (item, index) => item._id;

  render() {
    const titleConfig = {
      title: I18n.t('search'),
      tintColor: 'white'
    }
    const divColor = this._calcDividerColor(this.props.data[0])
    return (
      <FlatList
        data={this.props.data}
        extraData={this.state}
        keyExtractor={this._keyExtractor}
        renderItem={this._renderSong} 
        ItemSeparatorComponent={({item}) => <View style={{ height: 1, backgroundColor: divColor }} />}
        />
    )
  }


  renderSeparator = () => {
    return (
      <View>
      </View>
    )
  }
  _renderSong = ({ item }) => {

    return (
      <FavoritesListItem
        handler={(event) => this.props.onSelectedSong(item)}
        deleteHandler = {(event) => this.props.onDeleteItem(item)}
        song={item}
        key={item._id + item.num}>
      </FavoritesListItem>
    );
  }

  _calcDividerColor = (item) => {
    let dividerColor = 'black'
  
    if (_.toUpper(item.book.abbrv) == 'CE') {
      dividerColor = '#2f65b6'
    }
    else if (_.toUpper(item.book.abbrv) == 'MJ') {
      dividerColor = '#993c97'
    }
    else if (_.toUpper(item.book.abbrv) == 'EE') {
      dividerColor = '#747171'
    }
    else if (_.toUpper(item.book.abbrv) == 'VR') {
      dividerColor = '#a4c338'
    }
    else if (_.toUpper(item.book.abbrv) == 'RN') {
      dividerColor = '#27DB84'
    }
    else if (_.toUpper(item.book.abbrv) == 'HC') {
      dividerColor = '#FD8701'
    }
    if (_.toUpper(item.book.abbrv) == 'GA') {
      dividerColor = '#0f93ef'
    }
  
    return dividerColor
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