
exports.songs = (state = { nodes: {}, indexes: {}, favorites: {} }, action) => {

  switch (action.type) {
    case 'SET_SONGS':
      return Object.assign({}, state, {
        ...state,
        nodes: action.nodes
      })
    case 'SET_INDEXES': {
      return Object.assign({}, state, {
        ...state,
        indexes: action.indexes
      })
    }
    case 'SET_FAVORITES': {
      return Object.assign({}, state, {
        ...state,
        favorites: action.favorites
      })
    }
    default:
      return state
  }
}