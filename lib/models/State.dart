import 'package:cesperance/models/Song.dart';

class StateModel {
  bool isLoading;
  List<Song> favorites;
  String deviceId;

  StateModel({
    this.isLoading = false,
  });
}