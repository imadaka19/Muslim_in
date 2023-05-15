import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:muslim_in/view/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muslim_in/view/landingpage.dart';
import 'package:muslim_in/util/utils.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final String title = 'Firebase Auth';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Muslim-in',
      home: mainpage(),
    );
  }
}

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnimatedSplashScreen(
          splash: 'sources/logo muslim-in.png',
          splashIconSize: 250,
          duration: 1000,
          splashTransition: SplashTransition.scaleTransition,
          nextScreen:
              // LandingPage(),
              StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(child: CircularProgressIndicator());
              else if (snapshot.hasError)
                return Center(
                  child: Text('something wrong'),
                );
              else if (snapshot.hasData)
                return HomePage();
              else
                return LandingPage();
            },
          ),
        ),
      );
}
