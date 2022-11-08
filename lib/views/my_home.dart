

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutteradmobads/provider/Ads_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'Interstitial_ads_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  AdProvider adProvider= Provider.of<AdProvider>(context,listen: false);
  adProvider.initializeHomeBanner();
    AdProvider adProvide= Provider.of<AdProvider>(context,listen: false);
    adProvide.initializedFullPage();
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          const Text("This is example of admob ads"),
          Center(

            child: Consumer<AdProvider>(
                builder:(context,adProvider,child) {
                  if(adProvider.isHomePageBannerLoaded) {
                    return Container(
                      height: 60,
                      child: AdWidget(ad: adProvider.homePageBanner),
                    );
                  }
                  else
                  {
                    return Container(
                      color: Colors.red,
                    );
                  }
                }
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async{
        AdProvider adProvide= Provider.of<AdProvider>(context,listen: false);
        if(adProvide.isFullPageBannerLoaded){
          adProvide.fullPageAd.show();
        }

    Navigator.push(context, MaterialPageRoute(builder: (context)=>const InterstitialAdsScreen()));

      },child: const Icon(Icons.add)),

      );// This trailing comma makes auto-formatting nicer for build methods
  }
}