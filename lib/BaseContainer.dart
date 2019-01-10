import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget{
  final Widget child;
  BaseContainer({this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
        gradient: RadialGradient(
        center: Alignment.centerLeft,
        radius: 3,
        stops: [
        0.1,
        0.5,
        ],
        colors: [
        const Color.fromRGBO(28, 86, 231, 100),
    const Color.fromRGBO(70, 222, 249, 100)
    ],
    )),
    child: child
    );
  }
}