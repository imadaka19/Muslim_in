import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:muslim_in/view/homepage.dart';
import 'Landingpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainpage(),
    );
  }
}

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: AnimatedSplashScreen(
          splash: Container(
            color: Color(0xff1E1F26),
          ),
          backgroundColor: Color(0xff1E1F26),
          duration: 1000,
          splashTransition: SplashTransition.fadeTransition,
          nextScreen: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return HomePage();
              else
                return LandingPage();
            },
          ),
        ),
      );
}
// class home extends StatelessWidget {
//   const home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSplashScreen(
//         nextScreen: HomePage(),
//         splash: null,
//       ),
//     );
//   }
// }

// // void _openHomePage() {
// //   Navigator.push<void>(
// //     context,
// //     MaterialPageRoute<void>(
// //       builder: (BuildContext context) => const HomePage(),
// //     ),
// //   );
// // }

