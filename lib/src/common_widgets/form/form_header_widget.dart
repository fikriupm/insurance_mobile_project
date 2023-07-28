import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.titleFontSize = 32, // Default title font size (can be overridden)
  }) : super(key: key);

  //Variables -- Declared in Constructor
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;
  final double titleFontSize; // Add a new property for title font size

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Center( // Center the image horizontally
          child: Image(
            image: AssetImage(image),
            color: imageColor,
            height: size.height * imageHeight,
          ),
        ),
        SizedBox(height: heightBetween),
        Text(
          title,
          style: TextStyle(
            fontSize: titleFontSize, // Use the custom title font size
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          subTitle,
          textAlign: textAlign,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    );
  }
}
