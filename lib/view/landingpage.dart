import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:muslim_in/util/authpage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,

      // resizeToAvoidBottomInset: true,
      // backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   elevation: 0,
      //   flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //           colors: [
      //             const Color(0xFF272A35),
      //             const Color(0xFF373E4E),
      //           ],
      //           begin: const FractionalOffset(0.0, 0.0),
      //           end: const FractionalOffset(1.0, 0.0),
      //           stops: [0.0, 1.0],
      //           tileMode: TileMode.clamp),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color(0xFF272A35),
                  const Color(0xFF373E4E),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Stack(
            children: [
              // Container(
              //   // width: 1000,
              //   // height: 1000,
              //   // color: Color(0xff1E1F26),

              // ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 90,
                  ),
                  Image(
                    image: AssetImage('sources/logo polos muslim-in.png'),
                    width: 200,
                    // height: 200,
                  ),
                  // Container(
                  //   width: 10,
                  //   height: 50,
                  // ),
                  // Center(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text(
                  //         'Welcome',
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 36,
                  //             color: Color(0xffD0E1F9)),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    width: 10,
                    height: 50,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Selamat datang di Muslim.in App, apa saja yang kamu butuhkan, ada di App ini lho!',
                          style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 2),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 10,
                    height: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Container(
                      width: 390,
                      height: 420,
                      child: StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (context, snapshot) => AuthPage(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
