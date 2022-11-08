import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'apps/my_app.dart';

void main() {

  runApp(const MyApp());
  MobileAds.instance.initialize();
}


