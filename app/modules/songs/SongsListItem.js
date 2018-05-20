'use strict'

import React, { Component, PropTypes } from 'react'
import { View, StyleSheet, Text, TouchableOpacity, Platform } from 'react-native'

class SongListItem extends Component {
    constructor(props) {
        super(props)
    }

    render() {
        return (
            <TouchableOpacity onPress={this.props.handler}>
                <View style={[styles.box, this.props.box || {}]} >
                    <Text style={styles.textStyle}>{this.props.song.num}. {this.props.song.title}</Text>
                </View >
            </TouchableOpacity>
        )
    }
}

const styles = StyleSheet.create({
    box: {
        flex: 1,
        paddingTop: 10,
        paddingBottom: 10,
        alignItems: 'stretch',
        justifyContent: 'center',
    },
    textStyle: {
        ...Platform.select({
			ios: {
                fontWeight: '400',
                fontFamily: 'HelveticaNeue-Medium'
			},
			android: {
                fontWeight: '100',
                fontFamily: 'Roboto'
			}
		}),
        fontSize: 15,
        paddingLeft: 5
    }
})

module.exports = SongListItem