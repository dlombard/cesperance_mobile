import React, { PureComponent } from 'react'
import { View, Text, TextInput, SegmentedControlIOS } from 'react-native'
import FavoritesList from './FavoritesList'
import { navigatorStyle } from '../../styles/styles'

export default class Songs extends PureComponent {
  constructor(props) {
    super(props)
    this.state = {
      selectedIndex: 0
    }
  }

  _onSelectedSong = (song) => {
    this.props.actions.setSong(song)
    this.props.navigator.push({
      screen: "cereact.Song",
      title: `${song.num}. ${song.title}`,
      navigatorStyle
    })
  }
  _onDeleteItem = (song) => {
    console.log('delete')
    this.props.actions.deleteFavorite(song)
  }
  _onFilterChange = (text) => {

  }
  render() {
    if (this.props.songs.length > 0) {
      return (
        <View style={{ padding: 6 }}>
          <TextInput
            style={{ height: 40, borderColor: '#354ABB', borderWidth: 1, borderRadius: 1, marginTop: 10, paddingLeft: 5 }}
            placeholder=''
            returnKeyType='search'
            multiline={false}
            maxLength={30}
            onChangeText={(text) => this._onFilterChange(text)}
            autoCorrect={false}>
          </TextInput>
          <FavoritesList
            data={this.props.songs}
            onSelectedSong={this._onSelectedSong}
            onDeleteItem={this._onDeleteItem} />
        </View>
      )
    }
    return (
      <View>
        <Text> No Favorites </Text>
      </View>)
  }
}