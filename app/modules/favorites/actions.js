import * as actions from './actionTypes'

exports.deleteFavorite = (id) => {
  return {
    type: actions.DELETE_FAVORITE,
    id
  }
}

exports.setSong = (song) => {
  return {
    type: "SET_SELECTED_SONG",
    song
  }
}