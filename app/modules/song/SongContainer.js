import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as actions from './actions';
import Song from './Song'

function mapStateToProps(state, ownProps) {
  return {
    isFavorite: state.selectedSong.isFavorite,
    song: state.selectedSong.song,
    icon: state.selectedSong.icon
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(actions, dispatch)
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Song);
