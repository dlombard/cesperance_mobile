import { all, call, put, takeEvery, takeLatest, select } from 'redux-saga/effects'

import _ from 'lodash'
import { Platform } from 'react-native'

function* onSongSagas() {
  yield takeLatest("SET_FAVORITE", setFavorite)
  yield takeLatest("SET_SELECTED_SONG", setSelectedSong)

}

function* setFavorite(action) {
  const isFavorite = action.isFavorite
  const song = yield select(state => state.selectedSong.song)
  const id = song._id
  let favorites = yield select(state => state.songs.favorites)
  if (!favorites)
    favorites = {}
  if (isFavorite) {
    favorites[id] = id
  } else {
    delete favorites[id]
  }
  yield put({ type: 'SET_FAVORITES', favorites })
  yield put({ type: 'UPDATE_FAVORITE', isFavorite, icon: setIcon(isFavorite) })
  yield put({ type: 'FAVORITES_UPDATED', favorites })

}

function* setSelectedSong(action) {
  let favorites = yield select(state => state.songs.favorites)
  const song = action.song
  let isFavorite = false
  if (favorites) {
    if (favorites[song._id])
      isFavorite = true
    else
      isFavorite = false
  }
  yield put({ type: "SET_SONG", song, isFavorite, icon: setIcon(isFavorite) })
}


const setIcon = (isFavorites) => {
  if (isFavorites) {
    if (Platform.OS === 'ios') {
      return 'ios-heart'
    }
    return 'md-heart'
  } else {
    if (Platform.OS === 'ios') {
      return 'ios-heart-outline'
    }
    return 'md-heart-outline'
  }
}

export default onSongSagas