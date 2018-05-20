import React, { PureComponent } from 'react';
import {
  Text,
  View,
  TouchableOpacity,
  StyleSheet
} from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';

class FavoritesButton extends PureComponent {
  constructor(props) {
    super(props);
    console.log(props)
  }


  _toggleFav() {
    console.log(this.props)
    this.props.setFavorite(this.props.isFavorite)
  }

  render() {
    return (
      <TouchableOpacity
        onPress={() => this._toggleFav()}
      >
        <Icon name={this.props.icon} style={styles.button} size={20} />
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
export default FavoritesButton;