import { connect } from 'react-redux';
import { bindActionCreators } from 'redux';
import * as actions from './actions';
import HomeScreen from './HomeScreen'

function mapStateToProps(state, ownProps) {
  return {
    startTime: state.startApp.date,
    showLoading: state.showLoadingModal.value
  };
}

function mapDispatchToProps(dispatch) {
  return {
    actions: bindActionCreators(actions, dispatch)
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(HomeScreen);
