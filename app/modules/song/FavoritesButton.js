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
  }


  _toggleFav() {
    this.props.setFavorite(this.props.isFavorite)
  }

  render() {
    return (
      <TouchableOpacity
        style={[styles.rightButton]}
        onPress={() => this._toggleFav()}
      >
        <View style={[styles.rightButton]}>
          <Icon name={this.props.icon} style={styles.button} size={28} />
        </View>
      </TouchableOpacity>
    )
  }
}

const styles = StyleSheet.create({
  button: {
    color: 'white'
  },
  rightButton: {
    overflow: 'hidden',
    width: 34,
    flex: 1,
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
    marginRight: 10
  }
});
export default FavoritesButton;