exports.selectedSongs = (state = {}, action) => {
  switch (action.type) {
    case 'SONGS_LOADED':
      return Object.assign({}, state, {
        book: action.book,
        language: action.language,
        songs: action.songs
      })
    default:
      return state
  }
}