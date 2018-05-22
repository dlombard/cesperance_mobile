import { all, call, put, take, takeEvery, takeLatest, select } from 'redux-saga/effects'
import * as API from '../../requests/api'
import moment from 'moment'
import _ from 'lodash'
import mergesort from '../../utils/mergesort'
function* onHomeSagas() {
  yield takeLatest("CHECK_UPDATES", checkUpdates)
  yield takeLatest("FETCH_UPDATES", fetchUpdates)
  yield takeLatest("FETCH_UPDATES_SUCCEEDED", updateSongs)
  yield takeLatest("SONGS_UPDATES_COMPLETED", updateLastUpdatesDB)
  yield takeLatest("FETCH_ALL_SONGS", fetchAllSongs)
  yield takeLatest("FETCH_ALL_SONGS_SUCCEEDED", insertSongs)
  yield takeLatest("INSERT_SONGS_COMPLETED", updateLastUpdatesDB)
}


function* checkUpdates() {
  const now = moment().utc().format()
  try {

    const lastUpdate = yield select(state => state.lastUpdate)
    console.log(`lastUpdate: ${JSON.stringify(lastUpdate)}`)
    if (lastUpdate.time > moment(0).utc().format()) {
      yield put.resolve({ type: "FETCH_UPDATES", lastUpdate, now })
    }
    else {
      yield put({ type: 'FETCH_ALL_SONGS', now })
    }
  } catch (e) {
    console.log(e)
    yield put({ type: 'FETCH_ALL_SONGS', now })
  }
}

function* fetchUpdates(action) {
  const lastUpdate = action.lastUpdate
  const now = action.now
  switch (action.type) {
    case 'FETCH_UPDATES':
      const res = yield call(API.fetchSongsUpdatedSince, lastUpdate.time)
      const data = res.data
      yield put({ type: 'FETCH_UPDATES_SUCCEEDED', data, lastUpdate, now })
      break;
  }

}

function* updateSongs(action) {
  const data = action.data
  const lastUpdate = action.lastUpdate
  const now = action.now
  switch (action.type) {
    case 'FETCH_UPDATES_SUCCEEDED':
      yield call(setSongsState, data)

      yield put({ type: 'SONGS_UPDATES_COMPLETED', lastUpdate, now })
      break;
  }
}

function* fetchAllSongs(action) {
  yield put({ type: 'SHOW_LOADING_MODAL', value: true })
  const now = action.now
  switch (action.type) {
    case 'FETCH_ALL_SONGS':
      const res = yield call(API.fetchAllSongs)
      const songs = res.data
      yield put({ type: 'FETCH_ALL_SONGS_SUCCEEDED', songs, now })
      break
  }
}


function* getLastUpdate() {
  const t = yield take('LAST_UPDATE');
  console.log(t)
  return t
}

function* insertSongs(action) {
  const now = action.now
  const songs = action.songs
  switch (action.type) {
    case 'FETCH_ALL_SONGS_SUCCEEDED':
      yield put({ type: 'SHOW_LOADING_MODAL', value: false })

      const songsById = yield call(() => {
        let x = {}
        songs.forEach(song => {
          delete song.lyrics
          const id = song._id
          x[id] = song
        })

        return x
      })
      yield put({ type: 'SET_SONGS', nodes: songsById })
      yield put({ type: 'CREATE_SONGS_INDEX' })
      yield put({ type: 'INSERT_SONGS_COMPLETED', now })
      break
  }
  return
}
function* setSongsState(updates) {
  const nodes = yield select(state => state.songs.nodes)

  updates.forEach(item => {
    delete item.lyrics
    nodes[item._id] = item
  })

  yield put({ type: 'SET_SONGS', nodes })
  yield put({ type: 'CREATE_SONGS_INDEX' })
}
function* updateLastUpdatesDB(action) {
  const now = action.now
  console.log(`now: ${JSON.stringify(now)}`)
  switch (action.type) {
    case 'SONGS_UPDATES_COMPLETED':
      yield put({ type: "LAST_UPDATE", time: now })
      break;

    case 'INSERT_SONGS_COMPLETED':
      yield put({ type: "LAST_UPDATE", time: now })
      break;
  }
}
export default onHomeSagas