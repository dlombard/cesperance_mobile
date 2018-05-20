import React, { PureComponent } from 'react';
import {
  Text,
  View,
  TouchableOpacity,
  StyleSheet,
  Platform
} from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';

class SearchButton extends PureComponent {
  constructor(props) {
    super(props);
    this.state = {
      icon: Platform.OS === 'ios' ? 'ios-search' : 'md-search'
    }
  }
  _openSearch() {
    this.props.navigator.push({
      screen: "cereact.Search"
    })
  }

  render() {
    return (
      <TouchableOpacity
        onPress={() => this._openSearch()}
      >
        <Icon name={this.state.icon} style={styles.button} size={25} />
      </TouchableOpacity>
    )
  }
}

const styles = StyleSheet.create({
  button: {
    overflow: 'hidden',
    justifyContent: 'center',
    alignItems: 'center',
    color: 'white'
  },
});
export default SearchButton;