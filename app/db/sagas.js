import { all, call, put, take, takeEvery, takeLatest, select } from 'redux-saga/effects'
import _ from 'lodash'
import mergerSort from '../utils/mergesort'

function* onDBSagas() {
  yield takeEvery("CREATE_SONGS_INDEX", createSongsIndex)
}

function* createSongsIndex(action) {
  const songs = yield select(state => state.songs)
  let indexes = songs.indexes

  let songsById = songs.nodes
  let index = indexes['book_lang']
  if (!index) {
    index = {}
  }
  for (var id in songsById) {
    const song = songsById[id]
    const indexKey = `${_.toUpper(song.book.abbrv)}_${_.toUpper(song.language)
      }`

    if (index[indexKey]) {
      index[indexKey][id] = id
    } else {
      index[indexKey] = {}
      index[indexKey][id] = id
    }

  }
  indexes['book_lang'] = index
  yield put({ type: 'SET_INDEXES', indexes })
}


export default onDBSagas