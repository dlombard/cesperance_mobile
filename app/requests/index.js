import axios from 'axios'

const BASE_URL = 'https://api.cesperance.com/v2'

class RequestHelper {
  constructor(api_token) {
    this.header = {
      'content_type': 'application/json'
    }
    this._axios = axios.create({
      baseURL: BASE_URL
    })
    this._axios.defaults.headers.post['Content-Type'] = 'application/json';
    this._axios.defaults.headers.get['Content-Type'] = 'application/json';
  }

  exec(options) {
    return this._axios(options)
  }
}
module.exports = RequestHelper