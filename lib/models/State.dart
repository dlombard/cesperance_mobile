import 'package:startup_namer/models/Song.dart';

class StateModel {
  bool isLoading;
  List<Song> favorites;
  String deviceId;

  StateModel({
    this.isLoading = false,
  });
}