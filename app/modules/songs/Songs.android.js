import React, { PureComponent } from 'react'
import { View, TextInput, Button, ToolbarAndroid, Text } from 'react-native'
import SongsList from './SongsList'
import ScrollableTabView, { DefaultTabBar } from 'react-native-scrollable-tab-view'
import { navigatorStyle } from '../../styles/styles'
import I18n from '../../utils/Translations'

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
      passProps: { song },
      navigatorStyle
    })
  }
  _onFilterChange = (text) => {
    this.props.actions.filterSongs(text)
  }
  _onTabChange = (e) => {

    const index = e.i
    return this.setState({ selectedIndex: index }, () => {
      let language;
      if (this.state.selectedIndex == 0) {
        language = 'fr'
      } else {
        language = 'ht'
      }
      this.props.actions.changeLanguage(this.props.selectedBook, language)
    });

  }
  render() {
    return (
      <View style={{ flexDirection: 'column', flex: 1, padding: 5 }}>
        <View>
          <TextInput
            style={{ height: 40, borderColor: '#354ABB', borderWidth: 1, borderRadius: 1, marginTop: 10, paddingLeft: 5 }}
            placeholder=''
            returnKeyType='search'
            multiline={false}
            maxLength={30}
            onChangeText={(text) => this._onFilterChange(text)}
            autoCorrect={false}
            underlineColorAndroid='#354ABB'
          >
          </TextInput>
        </View>
        <View style={{ flex: 1 }}>
          <ScrollableTabView
            style={{ marginTop: 5, }}
            initialPage={0}
            renderTabBar={() => <DefaultTabBar />}
            onChangeTab={(e) => this._onTabChange(e)}
          >
            <View tabLabel={I18n.t('fr')}>
              <SongsList
                data={this.props.songs}
                onSelectedSong={this._onSelectedSong} />
            </View>
            <View tabLabel={I18n.t('ht')}>
              <SongsList
                data={this.props.songs}
                onSelectedSong={this._onSelectedSong} />
            </View>
          </ScrollableTabView>
        </View>
      </View >
    )
  }
}