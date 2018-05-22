import { combineReducers, createStore, applyMiddleware } from 'redux'
import * as homeReducers from './modules/home/reducers'
import * as songsReducers from './modules/songs/reducers'
import * as songReducers from './modules/song/reducers'
import * as favoritesReducers from './modules/favorites/reducers'
import * as dbReducers from './db/reducers'
import createSagaMiddleware from 'redux-saga'
import rootSaga from './rootSaga'
import { persistStore, persistReducer } from 'redux-persist'
import storage from 'redux-persist/lib/storage'
import FilesystemStorage from 'redux-persist-filesystem-storage'
import { Platform } from 'react-native';
console.log(`Platform: ${Platform.OS}`)
let persistConfig = {
  key: 'root',
  storage: Platform.OS === 'ios' ? storage : FilesystemStorage,
}
const sagaMiddleware = createSagaMiddleware()
const rootReducer = combineReducers({
  ...homeReducers,
  ...songsReducers,
  ...songReducers,
  ...dbReducers,
  ...favoritesReducers
});

const persistedReducer = persistReducer(persistConfig, rootReducer)

export default function configureStore(initialState) {
  //let store = createStore(persistedReducer)

  const store = createStore(persistedReducer, applyMiddleware(sagaMiddleware));
  sagaMiddleware.run(rootSaga)


  return store
}