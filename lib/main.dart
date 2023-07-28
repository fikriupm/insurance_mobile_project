
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insurance_boost/firebase_options.dart';
import 'package:insurance_boost/src/repository/authentication_repository/aunthentication_repository.dart';
import 'package:insurance_boost/src/utils/theme/theme.dart';
// import 'package:cloud_firestore/c loud_firestore.dart';

// void main() => runApp(const App());
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: const Scaffold(body: Center(child: CircularProgressIndicator())),
      // home: const CircularProgressIndicator(),
      // home: const WelcomeScreen()
    );
  }
}