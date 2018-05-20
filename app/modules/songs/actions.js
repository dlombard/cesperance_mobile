import * as actions from './actionTypes'

exports.changeLanguage = (book, language) => {
  return {
    type: actions.LOAD_SONGS,
    book,
    language
  }
}

exports.setSong = (song) => {
  return {
    type: "SET_SELECTED_SONG",
    song
  }
}