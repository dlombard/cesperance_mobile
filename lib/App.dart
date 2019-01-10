import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'StitchChannel.dart';
import 'models/State.dart';
import 'package:flutter/services.dart';
import 'package:startup_namer/models/Song.dart';

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
 // final StateModel state;

  static AppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
            as _InheritedStateContainer)
        .data;
  }

  @override
  AppState createState() => new AppState();
}

class AppState extends State<AppStateWidget> {
  StitchChannel _stitchService;
  StateModel state = new StateModel(isLoading: true);
  @override
  void initState() {
    super.initState();
    _stitchService = StitchChannel();
    StitchChannel.platform.setMethodCallHandler((MethodCall call){
      switch(call.method){
        case "reloadFavorites":
          loadFavorites();
          break;
        default:
          break;
      }
    });
    getDeviceId().then((onValue) {
      loadFavorites();
    });
  }

  List<Song> get favorites => state.favorites;

  void loadFavorites()  {
    if (state.deviceId == null) getDeviceId();
    try {
      _stitchService.getFavorites(state.deviceId).then((docs){
        print(docs.length);
        setState((){
          state.favorites = docs;
        });
      }
      );

    }catch(e){
      print(e);
    }
  }

  Future<void> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    state.deviceId = androidInfo.androidId;
    print(state.deviceId);
  }

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(data: this, child: widget.child);
  }
}
