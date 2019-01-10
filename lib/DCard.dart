import 'package:flutter/material.dart';

class DCard extends StatelessWidget {
  const DCard(
      {Key key,
      this.elevation,
      this.shape,
      this.boxDecoration,
      this.margin = const EdgeInsets.all(4.0),
      this.clipBehavior = Clip.none,
      this.text,
      this.semanticContainer = true,
      this.width,
      this.height,
      this.onTap})
      : super(key: key);

  final double elevation;
  final double width;
  final double height;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final EdgeInsetsGeometry margin;
  final bool semanticContainer;
  final Text text;
  final BoxDecoration boxDecoration;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          margin: margin ?? const EdgeInsets.all(10.0),
          decoration: boxDecoration ?? BoxDecoration(color: Colors.white),
          child: Row(
            children: <Widget>[
              Container(
                  alignment: Alignment.centerLeft,
                  height: height,
                  width: 10,
                  color: Colors.blue,
                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0)),
              text
            ],
          ),
        ));
  }
}
