'use strict'
import React from 'react'
import { Text } from 'react-native'
import shortid from 'shortid'

class HighlightedText extends React.Component {
  render() {
   
    let isNextHighlighted = false;
    const tag = this.props.tag;
    const text = this.props.children.replace(/\n/g, " ")
    const styles = this.props.styles;
    const id_ = shortid.generate()
    const texts = text.split(tag).map(function(t){
      const style = isNextHighlighted ? styles.highlighted : {color: 'black'};
      isNextHighlighted = !isNextHighlighted;
      return <Text style={style} key={shortid.generate()}>{t}</Text>;
    });
    const nextProps = {...this.props};
    if(nextProps.styles) delete nextProps.styles;
    if(nextProps.tag) delete nextProps.tag;
    return <Text numberOfLines={2} style={this.props.style} key={id_}>{texts}</Text>;
  }
}

module.exports = HighlightedText;