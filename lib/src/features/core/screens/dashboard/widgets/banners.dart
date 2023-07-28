import 'package:flutter/material.dart';
import 'package:insurance_boost/src/constants/colors.dart';
import 'package:insurance_boost/src/constants/image_strings.dart';
import 'package:insurance_boost/src/constants/text_strings.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    Key? key,
    required this.txtTheme,
  }) : super(key: key);

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200, // Set a fixed width for the Card widget
            child: Card(
              elevation: 4,
              color: tCardBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.white, // Add a white border
                  width: 2, // Set the border thickness
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage(tBannerImage1)),
                    const SizedBox(height: 16),
                    // Text(tDashboardBannerTitle1, style: txtTheme.headline4, maxLines: 2, overflow: TextOverflow.ellipsis),
                    // Text(tDashboardBannerSubTitle, style: txtTheme.headline4, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: 200, // Set a fixed width for the Card widget
            child: Card(
              elevation: 4,
              color: tCardBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.white, // Add a white border
                  width: 2, // Set the border thickness
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage(tBannerImage2)),
                    const SizedBox(height: 16),
                    // Text(tDashboardBannerTitle2, style: txtTheme.headline4, maxLines: 2, overflow: TextOverflow.ellipsis),
                    // Text(tDashboardBannerSubTitle, style: txtTheme.headline4, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
          SizedBox(
            width: 200, // Set a fixed width for the Card widget
            child: Card(
              elevation: 4,
              color: tCardBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: Colors.white, // Add a white border
                  width: 2, // Set the border thickness
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage(tBannerImage3)),
                    const SizedBox(height: 16),
                    // Text(tDashboardBannerTitle2, style: txtTheme.headline4, maxLines: 2, overflow: TextOverflow.ellipsis),
                    // Text(tDashboardBannerSubTitle, style: txtTheme.headline4, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
