import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/Ads_provider.dart';
import 'my_home.dart';

class InterstitialAdsScreen extends StatefulWidget {
  const InterstitialAdsScreen({Key? key}) : super(key: key);

  @override
  State<InterstitialAdsScreen> createState() => _InterstitialAdsScreenState();
}

class _InterstitialAdsScreenState extends State<InterstitialAdsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AdProvider adProvide= Provider.of<AdProvider>(context,listen: false);
    adProvide.initializedFullPage();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InterstitialAdsScreen"),
        leading: InkWell(child: Icon(Icons.arrow_back),onTap: (){
          AdProvider adProvide= Provider.of<AdProvider>(context,listen: false);
          if(adProvide.isFullPageBannerLoaded){
            adProvide.fullPageAd.show();
          }
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: 'abc',)));

        }),
      ),
    );
  }
}
