import 'package:flutter/material.dart';
import 'package:insurance_boost/src/constants/text_strings.dart';

class DashboardSearchBox extends StatelessWidget {
  const DashboardSearchBox({
    Key? key,
    required this.txtTheme,
  }) : super(key: key);

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Color.fromARGB(255, 255, 255, 255)), // Adjust the border width and color here
        borderRadius: BorderRadius.circular(8), // Add border radius for rounded corners
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2), // Adjusted vertical padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            // Wrap with Expanded to make the TextField fill the available space
            child: TextField(
              style: txtTheme.headline5?.apply(color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.7)), // Decreased font size
              decoration: InputDecoration(
                hintText: tDashboardSearch, // Add placeholder text
                hintStyle: txtTheme.headline5?.apply(color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5)), // Decreased hint color
                border: InputBorder.none, // Remove the border of the TextField
              ),
            ),
          ),
          const Icon(Icons.mic, size: 20), // Decreased icon size
        ],
      ),
    );
  }
}
