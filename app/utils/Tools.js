'use strict'
import React, { Component } from 'react'

import {
    AppRegistry,
    ScrollView,
    StyleSheet,
    TouchableOpacity,
    Text,
    View,
    WebView,
} from 'react-native'
import _ from 'lodash'

export function htmlToJSX(lyrics) {
    const returnValue = []
    var inputSplitNewLine = lyrics.split("\n");
    for (var str in inputSplitNewLine) {
        let line = ''
        line = _.replace(inputSplitNewLine[str], "<p>", '<p style="text-align:center,  margin: 0em;">')

        returnValue.push(line)
    }

    return _.join(returnValue, "")
}
export function lyricsToJSX(lyrics) {

    const returnValue = []
    var _lyrics = lyrics;
    var keys = ["1.", "2.", "3.", "4.", "5.", "6.", "7.", "8.", "Refrain", "Kè:", "Choeur:", "Choeur", "Kè", "Refrin", "Réfrin:", "Refren"];

    var keyChorus = ["Refrain", "Kè:", "Choeur:", "Choeur", "Kè", "Refrin", "Réfrin:", 'Refren'];

    var keywords = [""];


    var chorus = [""];
    for (var s in keys) {

        keywords.push(keys[s]);
    }
    for (var c in keyChorus) {
        chorus.push(keyChorus[c]);
    }

    var inputSplitNewLine = _lyrics.split("\n");
    var sb = "";
    //sb = sb.concat("<ViewContainer>\n");

    var isFirstLine = true;
    var isRefrain = false;
    for (var strline in inputSplitNewLine) {
        const line = `${_.capitalize(inputSplitNewLine[strline])}`
        if (keys.indexOf(line.trim()) >= 0) {
            if (keyChorus.indexOf(line.trim()) >= 0) {
                isRefrain = true
            }
            else {
                isRefrain = false
            }
            returnValue.push(
                <Text style={{ fontWeight: '600', fontSize: 16, color: '#070707' }} allowFontScaling={true} key={strline}>

                    {line}
                </Text>
            )
        }
        else {
            if (isRefrain) {
                returnValue.push(
                    <Text style={{ fontWeight: '500', fontSize: 16, color: '#070707' }} key={strline}>
                        {line}
                    </Text>
                )
            }
            else {
                returnValue.push(
                    <Text style={{ fontWeight: '300', fontSize: 16, color: '#070707' }} key={strline}>
                        {line}
                    </Text>
                )
            }
        }

    }
    return returnValue
}
export function lyricsToHTML(e) {
    var n = e,
        r = ["1.", "2.", "3.", "4.", "5.", "6.", "7.", "8.", "Refrain", "Kè:", "Choeur:", "Choeur", "Kè", "Refrin", "Réfrin:"],
        o = ["Refrain", "Kè:", "Choeur:", "Choeur", "Kè", "Refrin", "Réfrin:"],
        t = [""],
        a = [""];
    for (var c in r) t.push(r[c]);
    for (var s in o) a.push(o[s]);
    var i = n.split("\n")

    let l = '<!DOCTYPE html><html>'
    l = l.concat('<style>#chant {font-family:"Helvetica Neue", sans-serif; font-weight: 300; font-size:1.1em;color:#070707;text-align: center;} #refrain{font-family:"Helvetica Neue", sans-serif;font-weight: 400;font-size:1em;color:#070707;text-align: center;} h4{margin:0; padding:0.5em;} p{margin:0; padding:0;}</style>')
    l = l.concat('<body><div id="chant">')
    var g = !0,
        u = !1,
        p = !1;
    for (var f in i) {
        for (var b in r)
            if (0 == i[f].trim().toLowerCase().indexOf(r[b].toLowerCase()) && i[f].toLowerCase().trim().length == r[b].length) {
                if (g) l = l.concat("<h4>" + r[b] + "</h4><p>"), g = !1;
                else {
                    l = l.concat("</p>"), p && (p = !1, l = l.concat("</div>"));
                    for (var s in a) 0 == i[f].trim().toLowerCase().indexOf(a[s].toLowerCase()) && i[f].toLowerCase().trim().length == a[s].length && (l = l.concat('<div id="refrain">'), p = !0);
                    l = l.concat("</br><h4>" + r[b] + "</h4><p>")
                }
                u = !0, g = !1;
                break
            }
        u || i[f].length > 2 && (l = l.concat(i[f].trim() + " <br/>")), u = !1
    }
    l = l.concat("</p></br></div></body></html>")
    return l
}

export function removeAccentsByRegex(s) {
    var r = s.toLowerCase();
    r = r.replace(new RegExp("\\s", 'g'), "");
    r = r.replace(new RegExp("[àáâãäå]", 'g'), "a");
    r = r.replace(new RegExp("æ", 'g'), "ae");
    r = r.replace(new RegExp("ç", 'g'), "c");
    r = r.replace(new RegExp("[èéêë]", 'g'), "e");
    r = r.replace(new RegExp("[ìíîï]", 'g'), "i");
    r = r.replace(new RegExp("ñ", 'g'), "n");
    r = r.replace(new RegExp("[òóôõö]", 'g'), "o");
    r = r.replace(new RegExp("œ", 'g'), "oe");
    r = r.replace(new RegExp("[ùúûü]", 'g'), "u");
    r = r.replace(new RegExp("[ýÿ]", 'g'), "y");
    r = r.replace(new RegExp("\\W", 'g'), "");
    return r;
}