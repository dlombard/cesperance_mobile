import React, { PureComponent } from 'react'
import { View, TextInput, SegmentedControlIOS } from 'react-native'
import SongsList from './SongsList'
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
  _onFilterChange = (text) => {

  }
  render() {
    return (
      <View style={{ padding: 6 }}>
        <SegmentedControlIOS
          tintColor='#354ABB'
          values={['Francais', 'Kreyol']}
          selectedIndex={this.state.selectedIndex}
          onChange={(event) => {
            this.setState({ selectedIndex: event.nativeEvent.selectedSegmentIndex }, () => {
              let language;
              if (this.state.selectedIndex == 0) {
                language = 'fr'
              } else {
                language = 'ht'
              }
              this.props.actions.changeLanguage(this.props.selectedBook, language)
            });
          }}
        />
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