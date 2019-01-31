import 'package:firebase_admob/firebase_admob.dart';

class Ads{
  static final MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(keywords: ["songs", "chants", "christian", "jesus", "god", "protestant", "evangelical", "Donation"], );

  MobileAdTargetingInfo getTargetingInfo(){
    return targetingInfo;
  }
}