import { all, call, put, takeEvery, takeLatest, select } from 'redux-saga/effects'

import _ from 'lodash'
import { Platform } from 'react-native'

function* onFavoritesSagas() {
  yield takeLatest("DELETE_FAVORITE", deleteFavorite)
  yield takeLatest("FAVORITES_UPDATED", setFavoritesArray)

}

function* deleteFavorite(action) {
  const id = action.id

  let favorites = yield select(state => state.songs.favorites)
  delete favorites[id]

  yield put({ type: 'SET_FAVORITES', favorites })
  yield put({ type: 'FAVORITES_UPDATED', favorites })
}
function* setFavoritesArray(action) {
  const favorites = action.favorites
  const songs = yield select(state => state.songs.nodes)
  let favs = []

  Object.keys(favorites).forEach(key => favs.push(songs[key]) )
  yield put({type: 'SET_FAVORITES_ARRAY', favs})
}
export default onFavoritesSagas