import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as actions from './actions';
import Songs from './Songs'

function mapStateToProps(state, ownProps) {
  return {
    selectedBook: state.selectedSongs.book,
    selectedLanguage: state.selectedSongs.language,
    songs: state.selectedSongs.songs
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(actions, dispatch)
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Songs);
