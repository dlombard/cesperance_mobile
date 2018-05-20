import * as actions from './actionTypes'

exports.setFavorite = (isFavorite) => {
  return {
    type: actions.SET_FAVORITE,
    isFavorite: !isFavorite
  }
}

