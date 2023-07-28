import 'package:flutter/material.dart';
import 'package:insurance_boost/src/constants/colors.dart';
import 'package:insurance_boost/src/features/core/models/dashboard/categories_model.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    Key? key,
    required this.txtTheme,
    required this.context,
  }) : super(key: key);

  final TextTheme txtTheme;
  final BuildContext context; // Store the context

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list(context) ?? []; // Use the null-aware operator to handle null values
    return SizedBox(
      height: 45,
      child: ListView.builder(
        itemCount: list.length, // Now the length should be accessible
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            // children: [
            GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 170,
            height: 50,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: tDarkColor),
                  child: Center(
                    child: Text(
                      list[index].title,
                      style: txtTheme.headline6
                          ?.apply(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        list[index].heading,
                        style: txtTheme.headline6,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        list[index].subHeading,
                        style: txtTheme.bodyText2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
