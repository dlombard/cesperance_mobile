import * as actions from './actionTypes'
import moment from 'moment'

exports.startApp = () => {
  const now = moment().utc().format()
  return {
    type: actions.START_APP,
    date: now,
    _id: 'startApp'
  }
}

exports.checkSongsUpdates = () => {
  return {
    type: actions.CHECK_UPDATES
  }
}

exports.selectBook = (book = 'CE') => {
  return {
    type: actions.SELECT_BOOK,
    book: book
  }
}

exports.loadSongs = (book = 'CE', language= 'fr') => {
  return {
    type: actions.LOAD_SONGS,
    book,
    language
  }
}