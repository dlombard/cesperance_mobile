import RequestHelper from './index'
const request = new RequestHelper()

exports.fetchAllSongs = () => {
  console.log('fetchAllSongs')
  const options = {
    url: '/songs'
  }

  return request.exec(options)
}

exports.fetchSongsUpdatedSince = (date) => {
console.log('fetchSongsUpdatedSince')
  const options = {
    url: '/songs',
    params: {
      updatedAfter: date
    }
  }

  return request.exec(options)
}