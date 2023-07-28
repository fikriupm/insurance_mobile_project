import 'package:flutter/material.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/rewards/rewards.dart';
import 'package:insurance_boost/src/features/core/screens/pdf/pdf_screen.dart';

class DashboardCategoriesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoriesModel(
    this.title,
    this.heading,
    this.subHeading,
    this.onPress,
  );

  static List<DashboardCategoriesModel> list(BuildContext context) {
    return [
      DashboardCategoriesModel("S", "Share", "Click", null),
      DashboardCategoriesModel(
        "P",
        "Policy",
        "More",
        () {
          // Implement navigation logic here when Policy category is clicked
          // For example, you can use Navigator.push to navigate to the Policy screen
          // Example:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PdfScreen()),
          );
        },
      ),
      DashboardCategoriesModel(
        "B",
        "Bonus",
        "Clcik",
        () {
          // Implement navigation logic here when Policy category is clicked
          // For example, you can use Navigator.push to navigate to the Policy screen
          // Example:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DashBoardPage()),
          );
        },
      ),
      DashboardCategoriesModel("R", "Redemption", "More", null),
      DashboardCategoriesModel("B", "Banners", "More", null),
    ];
  }
}
