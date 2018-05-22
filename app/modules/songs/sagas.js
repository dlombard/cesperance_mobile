import { all, call, put, takeEvery, takeLatest, select } from 'redux-saga/effects'

import * as API from '../../requests/api'
import _ from 'lodash'
import mergersort from '../../utils/mergesort'
import { removeAccentsByRegex } from '../../utils/Tools'
const selectorSongs = (state) => state.selectedSongs

function* onSongsSagas() {
  yield takeLatest("LOAD_SONGS", loadSongs)
  yield takeLatest("FILTER_SONGS", filterSongs)
}

function* loadSongs(action) {
  switch (action.type) {
    case 'LOAD_SONGS':
      const book = action.book
      const language = action.language
      const songs = yield call(getSongs, { book: action.book, language: action.language })
      if (songs) {
        yield put.resolve({ type: 'SONGS_LOADED', book, language, songs, filteredSongs: songs })
      }

  }
}

function* getSongs(args) {
  let results = []
  const songs = yield select(state => state.songs)
  if (songs.indexes['book_lang']) {
    const index = songs.indexes['book_lang'][`${_.toUpper(args.book)}_${_.toUpper(args.language)}`]

    for (var id in index) {
      results.push(songs.nodes[id])
    }
    return mergersort(results)
  }
  Object.keys(songs.nodes).forEach(key => {
    let item = songs.nodes[key]
    if (item.book.abbrv == _.toUpper(args.book) && item.language == args.language) {
      results.push(item)
    }
  })
  return mergersort(results)
}

function* filterSongs(action) {
  let selectedSongs = yield select(selectorSongs)
  let filteredSongs = []
  const filter = action.filter
  if (filter) {

    const str = removeAccentsByRegex(filter)
    this.filtered = []
    for (const s in selectedSongs.songs) {
      const song = selectedSongs.songs[s]
      const search = `${song.title}${song.num}`
      if (removeAccentsByRegex(search.toLowerCase()).indexOf(str.toLowerCase()) >= 0) {
        filteredSongs.push(song)
      }
    }
    selectedSongs.filteredSongs = filteredSongs
    yield put.resolve({ type: 'SONGS_LOADED', ...selectedSongs, filteredSongs })
  }


}

export default onSongsSagas