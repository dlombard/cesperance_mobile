exports.selectedSong = (state = { song: {}, isFavorite: false, icon: 'ios-heart-outline' }, action) => {

  switch (action.type) {
    case 'SET_SONG':
      console.log(action)
      return Object.assign({}, state, {
        song: action.song,
        isFavorite: action.isFavorite,
        icon: action.icon
      })
    case 'UPDATE_FAVORITE':
      return Object.assign({}, state, {
        ...state,
        isFavorite: action.isFavorite,
        icon: action.icon
      })
    default:
      return state
  }
}
