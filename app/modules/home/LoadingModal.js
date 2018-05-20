import React, { PureComponent } from 'react'
import { View, Modal, Text, Button, ActivityIndicator, StyleSheet } from 'react-native'
import I18n from '../../utils/Translations'

export default class LoadingModal extends PureComponent {
  constructor(props) {
    super(props)
  }


  render() {
    return (
        <Modal
          animationType={'slide'}
          transparent={true}
          visible={true}
          onRequestClose={() => { }}
        >
          <View style={[styles.container, modalBackgroundStyle]}>
            <View style={[styles.innerContainer, innerContainerTransparentStyle]}>
              <Text>{I18n.t('downloading')}</Text>
              <ActivityIndicator
                style={[styles.centering, { height: 80 }]}
                size="large"
                color='#354ABB'
              />
            </View>
          </View>
        </Modal>
    )
  }
}

var modalBackgroundStyle = {
  backgroundColor: 'rgba(0, 0, 0, 0.5)' 
};
var innerContainerTransparentStyle = { backgroundColor: '#fff', padding: 20 }

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    padding: 20,
  },
  homeView: {
    flex: 1,
    flexDirection: 'column',
    margin: 20,
    marginTop: 76

  },
  rowView: {
    flexDirection: 'row',
    justifyContent: 'center',
  },
  textStyle: {
    fontFamily: 'Helvetica Neue',
    color: '#354ABB',
    alignItems: 'center'
  },
  progressView: {
    marginTop: 20,
    marginBottom: 20
  },
  toolbar: {
    backgroundColor: '#354ABB',
    height: 56,
  },
})
