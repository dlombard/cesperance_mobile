import React, { PureComponent } from 'react'
import { View, TextInput } from 'react-native'
import SongsList from './SongsList'
import { navigatorStyle } from '../../styles/styles'

export default class Songs extends PureComponent {
  constructor(props) {
    super(props)
  }

  _onSelectedSong = (song) => {

    this.props.navigator.push({
      screen: "cereact.Song",
      title: `${song.num}. ${song.title}`,
      passProps: { song },
      navigatorStyle
    })
  }
  _onFilterChange = (text) => {

  }
  render() {
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
        <SongsList
          data={this.props.songs}
          onSelectedSong={this._onSelectedSong} />
      </View>
    )
  }
}