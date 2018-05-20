'use strict'

import React, { Component, PropTypes } from 'react'
import { View, StyleSheet, Text, TouchableOpacity } from 'react-native'
import HighlightedText from './HighlightedText'

class SearchListItem extends Component {
    constructor(props) {
        super(props)
    }

    render() {
        const { song } = this.props
        return (
            <View>
                <TouchableOpacity onPress={this.props.handler} >
                    <View>
                        <Text>
                            {song.num}. {song.book.name} {song.language}
                        </Text>
                        <Text style={styles.title}>
                            {song.title}
                        </Text>
                        <HighlightedText tag="**"
                            style={styles.lyrics}
                            styles={{ highlighted: styles.highlighted }}
                            numberOfLines={2}
                            id={`${song._id.$oid}.`}>
                            {`...${song._snippetResult.lyrics.value}...`}
                        </HighlightedText>
                    </View>
                    <View style={styles.divider}>
                    </View>
                </TouchableOpacity>
            </View>
        )
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'flex-start',
        paddingTop: 10,
    },
    text: {
        fontSize: 8,
        color: 'dimgray'
    },
    title: {
        textAlign: 'left',
        color: '#354ABB',
        borderColor: '#ccc',
        width: 270,
        marginBottom: 2

    },
    lyrics: {
        textAlign: 'left',
        color: '#5c5c5c',
        borderColor: '#ccc',
        marginBottom: 2
    },
    highlighted: {
        color: '#354ABB',
        fontWeight: 'bold'
    },
    divider: {
        backgroundColor: '#354ABB',
        marginHorizontal: 5,
        height: 1,
        marginTop: 5,
        marginBottom: 5,
        alignItems: 'center'
    }
})

module.exports = SearchListItem