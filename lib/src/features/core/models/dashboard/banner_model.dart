import 'package:flutter/widgets.dart';

class BannerModel {
  final String imageUrl;
  final String title;
  final String subTitle;

  BannerModel({
    required this.imageUrl,
    required this.title,
    required this.subTitle,
  });
final bannersList = [
  BannerModel(
    imageUrl: 'assets/images/family.png',
    title: 'Banner 1 Title',
    subTitle: 'Banner 1 Subtitle',
  ),
  BannerModel(
    imageUrl: 'assets/images/car.png',
    title: 'Banner 2 Title',
    subTitle: 'Banner 2 Subtitle',
  ),
  BannerModel(
    imageUrl: 'assets/images/rebate.png',
    title: 'Banner 3 Title',
    subTitle: 'Banner 3 Subtitle',
  ),];

}
