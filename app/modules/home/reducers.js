import moment from 'moment'

exports.startApp = (state = {}, action) => {
  switch (action.type) {
    case 'START_APP':
      return Object.assign({}, state, {
        _id: action._id,
        date: action.date
      })
    default:
      return state
  }

}

exports.rehydrate = (state = {}, action) => {
  console.log(action.type)
  switch (action.type) {
    case 'persist/REHYDRATE':
      console.log(action)
      return Object.assign({}, state, {
        t: action._id,
        x: action.payload
      })
    default:
      return state
  }

}

exports.showLoadingModal = (state = { value: false }, action) => {
  switch (action.type) {
    case 'SHOW_LOADING_MODAL':
      console.log(`show loading modal: ${action.value}`)
      return Object.assign({}, state, {
        value: action.value
      })
    default:
      return state
  }

}

exports.lastUpdate = (state = { time: moment(0).utc().format() }, action) => {
  switch (action.type) {
    case 'LAST_UPDATE':
      return Object.assign({}, state, {
        time: action.time
      })
    case 'GET_LAST_UPDATE':
      return state
    default:
      return state
  }
}
