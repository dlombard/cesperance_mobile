exports.favorites = (state = { nodes: [] }, action) => {
  switch (action.type) {
    case 'SET_FAVORITES_ARRAY':
      return Object.assign({}, state, {
        nodes: action.favs
      })
    default:
      return state
  }
}