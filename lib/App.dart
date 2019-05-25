import 'package:flutter/material.dart';
import 'models/State.dart';

class _InheritedStateContainer extends InheritedWidget {
  final AppState data;
  const _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

class AppStateWidget extends StatefulWidget {
  AppStateWidget({@required this.child,});


  final Widget child;

  static AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  AppState createState() => new AppState();
}

class AppState extends State<AppStateWidget> {
  StateModel state = new StateModel(isLoading: true);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(data: this, child: widget.child);
  }
}
