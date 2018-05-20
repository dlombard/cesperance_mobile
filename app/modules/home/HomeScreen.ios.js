import React, { PureComponent } from 'react'
import {
  ScrollView,
  StyleSheet,
  TouchableOpacity,
  TouchableHighlight,
  Text,
  View
} from 'react-native'

import ImageButton from '../../Components/ImageButton'
import * as Strings from '../../utils/Strings'
import LoadingModal from './LoadingModal'
import MenuButton from '../MenuButton'

export let homeNavigator = null
const navigatorButtons = (navigator) => {
  console.log(navigator)
  return {
    leftButtons: [{
      component: 'CustomButton',
      id: 'menu',
      passProps: {
        navigator
      }
    }
    ],
    rightButtons: [{
      component: 'SearchButton',
      id: 'search',
      passProps: {
        navigator
      }
    }]
  }
}

export default class HomeScreen extends PureComponent {

  constructor(props) {
    super(props)
    homeNavigator = this.props.navigator
    this.state = {
      font: 'Helvetica Neue',
      isFirst: true,
      animationType: 'slide',
      modalVisible: true,
      transparent: true,
      visible: true,
      animating: true,

    }
    this.props.navigator.setButtons(navigatorButtons(this.props.navigator));
  }

  componentWillMount() {
    this.props.actions.startApp()

  }
  componentDidMount() {
    this.props.actions.checkSongsUpdates()
  }

  onNavigatorEvent(event) {
    if (event.type == 'NavBarButtonPress') { // this is the event type for 
      if (event.id == 'menu') { // this is the same id field from the static navigatorButtons definition
        _toggleDrawer()
      }
    }
  }
  _toggleDrawer() {
    this.props.navigator.toggleDrawer({
      to: 'closed',
      side: 'left',
      animated: true
    });
  }

  render() {

    const titleConfig = {
      title: Strings.titles['ce'],
      tintColor: 'white',
    }
    const showLoading = this.props.showLoading
    return (

      <View style={styles.homeView}>

        {showLoading ? <LoadingModal /> : null}

        <View style={styles.rowView}>
          <ImageButton
            source={require('../../res/img/ce.png')}
            text={Strings.titles['ce']}
            handler={(event) => this._navigateToSongList(Strings.titles['ce'], 'ce', 'fr')}
          />
          <ImageButton
            source={require('../../res/img/mj.png')}
            text={Strings.titles['mj']}
            handler={(event) => this._navigateToSongList(Strings.titles['mj'], 'mj', 'fr')}
          />
        </View>
        <View style={styles.rowView}>
          <ImageButton
            source={require('../../res/img/ee.png')}
            text={Strings.titles['ee']}
            handler={(event) => this._navigateToSongList(Strings.titles['ee'], 'ee', 'fr')}
          />
          <ImageButton
            source={require('../../res/img/vr.png')}
            text={Strings.titles['vr']}
            handler={(event) => this._navigateToSongList(Strings.titles['vr'], 'vr', 'fr')} />
        </View>
        <View style={styles.rowView}>
          <ImageButton
            source={require('../../res/img/rn.png')}
            text={Strings.titles['rn']}
            handler={(event) => this._navigateToSongList(Strings.titles['rn'], 'rn', 'fr')} />
          <ImageButton
            source={require('../../res/img/hc.png')}
            text={Strings.titles['hc']}
            handler={(event) => this._navigateToSongList(Strings.titles['hc'], 'hc', 'fr')}
          />
        </View>
      </View>
    );
  }


  _navigateToSongList(title, book, language) {
    const item = {
      book,
      language,
      title
    }
    this.props.actions.loadSongs(book, language)
    this.props.navigator.push({
      screen: "cereact.Songs"
    })
  }
  _navigateToSearch() {
    this.props.navigator.push({
      screen: "cereact.Search"
      //sceneConfig: Navigator.SceneConfigs.FloatFromLeft
    })
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
  },
  homeView: {
    flex: 1,
    flexDirection: 'column',
    margin: 20,
    marginTop: 50

  },
  rowView: {
    flexDirection: 'row',
    justifyContent: 'center',
  },
  textStyle: {
    fontFamily: 'Helvetica Neue',
    color: '#354ABB',
    alignItems: 'center'
  },
  progressView: {
    marginTop: 20,
    marginBottom: 20
  },
  toolbar: {
    backgroundColor: '#354ABB',
    height: 56,
  },
})