import { all, fork } from 'redux-saga/effects';
import onHomeSagas from './modules/home/sagas'
import onSongsSagas from './modules/songs/sagas'
import onSongSagas from './modules/song/sagas'
import onDBSagas from './db/sagas'
import onFavoritesSagas from './modules/favorites/sagas'
function* rootSaga() {
  return yield all([
    fork(onHomeSagas),
    fork(onSongsSagas),
    fork(onDBSagas),
    fork(onSongSagas),
    fork(onFavoritesSagas)
  ])
}

export default rootSaga