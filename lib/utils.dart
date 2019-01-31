import 'package:cesperance/StitchChannel.dart';
final StitchChannel stitchChannel = new StitchChannel();

class Utils {
  static bool prevIsStrong = false;


  Future<void> getFavorites() async{
    try{
      return await stitchChannel.getFavorites();
    }catch(e){
      throw e;
    }
  }
}
