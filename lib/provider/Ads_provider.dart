import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutteradmobads/ads/ads_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdProvider with ChangeNotifier{
  //this for banner ads
  bool isHomePageBannerLoaded=false;
  late BannerAd homePageBanner;

  bool isFullPageBannerLoaded=false;
  late InterstitialAd fullPageAd;
 Future<void> initializeHomeBanner()  async {
   homePageBanner=BannerAd(size: AdSize.banner,
       adUnitId: AdHelper.homeBanner(),
       listener:  BannerAdListener(
         onAdLoaded: (ad){
           print("HomePage Banner");
           isHomePageBannerLoaded=true;
         },
         onAdClosed: (ad){
           print("HomePage Banner");
           ad.dispose();
           isHomePageBannerLoaded=false;
         },
         onAdFailedToLoad: (ad,error){
           print("error in this line${error.toString()}");
           isHomePageBannerLoaded=true;
         }

       ),
       request: const AdRequest(
       ));
await homePageBanner.load();
notifyListeners();
 }
  void initializedFullPage() async{
 await  InterstitialAd.load(adUnitId: AdHelper.fullPageAds(),
     request: AdRequest(), adLoadCallback: InterstitialAdLoadCallback(
     onAdLoaded: (ad){
       print("Full page Ad loaded ");
       fullPageAd=ad;
       isFullPageBannerLoaded=true;
     }, onAdFailedToLoad:(err){
       print("${err.toString()}");
       isFullPageBannerLoaded=false;
     }));
 notifyListeners();
  }
}