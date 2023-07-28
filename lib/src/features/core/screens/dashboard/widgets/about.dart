import 'package:flutter/material.dart';
import 'package:insurance_boost/src/constants/global_variables.dart';

class AboutPage extends StatelessWidget {
  final String imagePath = 'assets/images/us.jpg';
  final String title = 'SSE3401-1 Group Project';
  final String name =
      'FIKRI 211589\nZULHAKIMI 209853\nAMMAR 211873\nZIYAD 213644\nIZZAT 212849\nJAROD 212593';
  final String details =
      'Welcome to eNsurance, your trusted insurance partner! \nAt eNsurance, we are committed to providing you with the best insurance solutions to protect what matters most to you. Our mission is to offer comprehensive coverage, exceptional service, and peace of mind to our valued customers. We value your trust and appreciate the opportunity to serve you. If you have any questions, need assistance, or want to explore insurance options, please do not hesitate to contact us. Our team is always ready to help you navigate the world of insurance and make informed decisions.\nThank you for choosing eNsurance as your insurance partner. We look forward to protecting what matters most to you!\n\nYour eNsurance Team';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(184, 137, 185, 253), // Change the base color to light blue
      appBar: AppBar(
        backgroundColor: NIGHT_MODE ? appBarDark : appBarLight,
        centerTitle: true,
        title: Text(
          "About Us",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: NIGHT_MODE ? leftIconDark : leftIconLight,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 57, 98),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: TextStyle(
                      color: Color.fromARGB(255, 1, 39, 82),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    details,
                    style: TextStyle(
                      color: NIGHT_MODE ? blackwordDark : blackwordLight,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
