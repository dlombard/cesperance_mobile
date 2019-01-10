import 'package:flutter/material.dart';

class Utils {
  static bool prevIsStrong = false;

  Widget toText(String line) {
    line = line
        .replaceAll("<p>", " ")
        .replaceAll("<\/p>", "")
        .replaceAll("<br\/>", "");
    if (line.contains("<strong>") || line.contains("<//strong>")) {
      double topPadding = 5;
      if (!prevIsStrong) {
        topPadding = 15;
        prevIsStrong = true;
      }
      line = line.replaceAll("<strong>", "").replaceAll("<\/strong>", "");
      return Padding(
        child: Text(line,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
        padding: EdgeInsets.fromLTRB(0, topPadding, 0, 0),
      );
    } else {
      prevIsStrong = false;
      return (Text(line,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, letterSpacing: 0.7)));
    }
  }
}
