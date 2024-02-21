import 'package:amazon/utils/color_themes.dart';
import 'package:amazon/utils/constants.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  int currentAd = 0;

  get mediaQuery => null;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
       if (currentAd == (largeAds.length -1)) {
        currentAd = -1;
       }
               setState(() {
          currentAd++;
        });
      },
      child: Stack(
        children: [
          Image.network(
            largeAds[currentAd],
            width: double.infinity,
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: screenSize.width,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    backgroundColor,
                    backgroundColor.withOpacity(0),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
