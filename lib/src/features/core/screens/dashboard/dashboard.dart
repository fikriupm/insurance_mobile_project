import 'package:flutter/material.dart';
import 'package:insurance_boost/src/constants/colors.dart';
import 'package:insurance_boost/src/constants/sizes.dart';
import 'package:insurance_boost/src/constants/text_strings.dart';
import 'package:insurance_boost/src/features/core/controllers/pdf_controller.dart';
import 'package:insurance_boost/src/features/core/models/pdf_model.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/widgets/NavBar.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/widgets/appbar.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/widgets/bot_nav.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:insurance_boost/src/features/core/screens/dashboard/widgets/search.dart';
import 'package:insurance_boost/src/features/core/screens/pdf/pdf_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      drawer: NavBar(), // Add your NavBar widget here
      appBar: DashboardAppBar(
        isDark: isDark,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              isDarkMode ? tSecondaryColor : tPrimaryColor,
              isDarkMode
                  ? tSecondaryColor.withOpacity(0.9)
                  : tPrimaryColor.withOpacity(0.9),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(tDashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dashboard Heading
                Text(
                  tDashboardHeading,
                  style: txtTheme.headline4?.copyWith(
                    fontSize: 28, // Increased font size for the heading
                    fontWeight: FontWeight.bold, // Added bold style
                    color: isDarkMode
                        ? Colors.white
                        : Colors.black, // Adjusted text color based on theme
                  ),
                ),
                const SizedBox(height: tDashboardPadding),

                // Banners
                Text("Deals",
                    style: txtTheme.headline4?.apply(fontSizeFactor: 0.6)),
                DashboardBanners(txtTheme: txtTheme),
                const SizedBox(height: tDashboardPadding),

                // Categories
                Text("Quick Links",
                    style: txtTheme.headline4?.apply(fontSizeFactor: 0.6)),
                DashboardCategories(
                    txtTheme: txtTheme,
                    context: context), // Pass the context here
                const SizedBox(height: tDashboardPadding),

                Text("My Policies",
                    style: txtTheme.headline4?.apply(fontSizeFactor: 0.6)),
                FutureBuilder<List<PdfModel>>(
                  future: PdfController().getAllPdf(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Show a loading spinner while fetching data
                    } else if (snapshot.hasData) {
                      // Display the first 3 PDFs in a list or grid view
                      return Column(
                        children: [
                          for (final pdf in snapshot.data!.take(5))
                            ListTile(
                              leading: Icon(Icons.picture_as_pdf),
                              title: Text(pdf.name),
                              onTap: () {
                                // Code to open the PDF viewer screen
                                // You can use the same code you provided earlier
                                final url = pdf.url;
                                if (url.isNotEmpty &&
                                    Uri.tryParse(url) != null) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          PdfViewerScreen(pdfUrl: url),
                                    ),
                                  );
                                } else {
                                  // Show an error message for invalid PDF URL
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Invalid PDF URL'),
                                        content: const Text(
                                            'The PDF URL is not valid.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              },
                            ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PdfScreen(),
                                  ),
                                );
                              },
                              child: Text(
                                'See More PDF',
                                style: TextStyle(color: Color.fromARGB(255, 96, 8, 2)),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      // Handle the case where no PDFs are available
                      return Text('No PDFs found.');
                    }
                  },
                ),

                // Search Box
                Container(
                  margin: const EdgeInsets.only(
                      top: 10), // Add some margin to make it visible
                  child: DashboardSearchBox(txtTheme: txtTheme),
                ),
                const SizedBox(height: tDashboardPadding),
              ],
            ),
          ),
        ),
      ),

      // Add the BotNavBar widget as the bottom navigation bar
      bottomNavigationBar: const BotNavBar(),

      // Set the background color of the Scaffold to the same gradient used in the Container
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
    );
  }
}
