import 'dart:io';

class AdHelper {
 static String homeBanner() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    }
    else {
      return "";
    }
  }
 static String detailPageBanner() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    }
    else {
      return "";
    }
  }
 static String fullPageAds() {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    }
    else {
      return "";
    }
  }
}