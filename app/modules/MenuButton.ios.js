import React, { PureComponent } from 'react';
import {
  Text,
  View,
  TouchableOpacity,
  StyleSheet
} from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';

class MenuButton extends PureComponent {
  constructor(props) {
    super(props);

  }


  _toggleDrawer() {
    this.props.navigator.toggleDrawer({
      side: 'left',
      animated: true
    });
  }

  render() {
    return (
      <TouchableOpacity
        onPress={() => this._toggleDrawer()}
      >
        <Icon name='ios-menu' style={styles.button} size={25} />
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
export default MenuButton;