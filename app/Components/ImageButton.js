

import React, {PureComponent, PropTypes} from 'react'
import {View, StyleSheet, TouchableHighlight, Text, Image, TouchableOpacity} from 'react-native'

export default class ImageButton extends PureComponent {

    constructor(props) {
        super(props)
    }
    render() {
        return (
            <TouchableOpacity style={styles.touchableArea} onPress={this.props.handler} activeOpacity={0.7}>
                <View style= {[styles.imageButtonContainer, this.props.buttonStyle || {}]} >
                    <Image style={[styles.image, this.props.imgStyle || {}]} source={this.props.source}/>
                    <Text numberOfLines= {2} style={[styles.imgText, this.props.txtStyle || {}]}>
                        {this.props.text}
                    </Text>
                </View >
            </TouchableOpacity>
        )
    }
}

const styles = StyleSheet.create({
    touchableArea: {
        flex: 0.5,
        justifyContent: 'center',
        alignItems: 'center',
    },
    imageButtonContainer: {
        flexDirection: 'column',
        justifyContent: 'flex-start',
        alignItems: 'center',
        padding: 20,
        width: 200,

    },
    image: {
        marginBottom: 10,
    },
    imgText: {
      fontFamily: 'Helvetica Neue',
        color: 'black',
        fontSize: 16,
		    fontWeight: '500',
        textAlign: 'center'
    }
})

