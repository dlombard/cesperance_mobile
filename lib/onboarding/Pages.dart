import 'package:flutter/material.dart';
import 'PageViewModel.dart';

class Pages extends StatelessWidget{

  final PageViewModel viewModel;
  final double percentVisible;
  final titleStyle = TextStyle( color: Colors.white, fontSize: 34.0, fontWeight:FontWeight.w800, fontFamily: 'Raleway');
  final descriptionStyle = TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0, );

  Pages({
    this.viewModel,
    this.percentVisible = 1.0,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      color: viewModel.color,
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child:
    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Image.asset(viewModel.image, filterQuality: FilterQuality.high, fit: BoxFit.none,)),
          Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(viewModel.title, style: titleStyle),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: Text(viewModel.description, style: descriptionStyle, textAlign: TextAlign.center, )
          ),

        ]
    ),

    );
  }
}
