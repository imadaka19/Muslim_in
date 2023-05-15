import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:muslim_in/view/almatsurat.dart';
import 'package:muslim_in/view/tasbih.dart';
import 'package:muslim_in/view/quran.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:muslim_in/util/qiblat.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_in/view/Resto.dart';

class GuestHomePage extends StatelessWidget {
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: SizedBox(
          child: RichText(
            text: TextSpan(
              text: "Halo, ",
              style: TextStyle(fontSize: 18),
              children: [
                TextSpan(
                  text: 'Guest',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.menu),
        //     color: Colors.white,
        //   )
        // ],
        elevation: 0,
        flexibleSpace: Container(
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
        ),
        centerTitle: false,
        actions: [
          Row(
            children: [
              // Text(
              //   'Exit',
              //   style: TextStyle(fontSize: 16),
              // ),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.exit_to_app, color: Colors.white),
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
      body: Stack(
        children: [
          // Column(children: [
          //   RichText(
          //     text: TextSpan(
          //       text: "Halo, ",
          //       style: TextStyle(fontSize: 18),
          //       children: [
          //         TextSpan(
          //           text: 'Izzah',
          //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //         ),
          //       ],
          //     ),
          //   ),
          // ]),

          Container(
            // width: 1000,
            // height: 1000,
            // color: Color(0xff1E1F26),
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
          ),
          Column(
            children: [
              Stack(
                children: [
                  // DottedBorder(
                  //     color: Colors.white,
                  //     strokeWidth: 3,
                  //     dashPattern: [8, 4],
                  //     child: Container(
                  //       height: 600.0,
                  //       width: 350.0,
                  //       decoration: BoxDecoration(border: Border.all()),
                  //       // color: Colors.black,
                  //       child: GestureDetector(
                  //         onTap: _incrementCount,
                  //       ),
                  //     ),
                  //   ),
                  JadwalS(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // GestureDetector(
                  //   onTap: () => {},
                  //   child: Image(
                  //     image: AssetImage('sources/fitur/alquran kotak.png'),
                  //     fit: BoxFit.cover,
                  //     height: 80,
                  //   ),
                  // ),
                  // Column(
                  //   children: [
                  //     ButtonBar(
                  //       children: [
                  //         Container(
                  //           width: 95,
                  //           height: 95,
                  //           child: IconButton(
                  //             // width: 90,
                  //             // height: 90,
                  //             icon: Image.asset(
                  //               'sources/fitur/alquran kotak.png',
                  //               fit: BoxFit.cover,
                  //             ),
                  //             onPressed: () {
                  //               LandingPage();
                  //             },
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           height: 5,
                  //         ),
                  //         Text(
                  //           "Al-Qur'an",
                  //           style: TextStyle(fontSize: 16, color: Colors.white),
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  Fitur(
                    title: "Al-Qur'an",
                    icon: 'sources/fitur/alquran kotak.png',
                    file: Quran(),
                  ),
                  Fitur(
                    title: "Tasbih",
                    icon: 'sources/fitur/Tasbih kotak.png',
                    file: Tasbih(),
                  ),
                  // Fitur(
                  //   title: "Musholla",
                  //   icon: 'sources/fitur/Musholla kotak.png',
                  //   file: _launchUrl(),
                  // ),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: IconButton(
                          // width: 90,
                          // height: 90,
                          icon: Image.asset(
                            'sources/fitur/Musholla kotak.png',
                            fit: BoxFit.cover,
                          ),
                          onPressed: () => MapUtils.openMap(),
                          // child: const CustomWidget(
                          //   icon: Icons.language,
                          //   label: 'Open a URL',
                          // ),
                        ),
                      ),
                      Text(
                        "Musholla",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Fitur(
                    title: "Qiblat",
                    icon: 'sources/fitur/qiblat kotak.png',
                    file: Qiblat(),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: IconButton(
                          // width: 90,
                          // height: 90,
                          icon: Image.asset(
                            'sources/fitur/halal kotak.png',
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Color(0xFF1E1F26),
                                context: context,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                builder: (context) => SizedBox(
                                    height: 150,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Fitur(
                                            title: "South Korea",
                                            icon: "sources/fitur/korsel.png",
                                            file: Resto()),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 100,
                                              height: 100,
                                              child: IconButton(
                                                // width: 90,
                                                // height: 90,
                                                icon: Image.asset(
                                                  "sources/fitur/jepang.png",
                                                  fit: BoxFit.cover,
                                                ),
                                                onPressed: () {
                                                  // Navigator.push(context, MaterialPageRoute(builder: (_) => file));
                                                },
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 5,
                                            // ),
                                            Text(
                                              "Japan",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                            Text(
                                              "(Coming Soon)",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )));
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        "Resto Halal",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: IconButton(
                          // width: 90,
                          // height: 90,
                          icon: Image.asset(
                            'sources/fitur/almatsurat kotak.png',
                            fit: BoxFit.cover,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Color(0xFF1E1F26),
                                context: context,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                builder: (context) => SizedBox(
                                      height: 150,
                                      child: ListView(
                                        children: [
                                          ListTile(
                                            leading: Icon(
                                              Icons.sunny,
                                              color: Colors.white,
                                            ),
                                            title: Text(
                                              'Dzikir Pagi',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          DzikirPagi(
                                                              title: 'Pagi')));
                                            },
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.mode_night,
                                                color: Colors.white),
                                            title: Text(
                                              'Dzikir Petang',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          DzikirPagi(
                                                              title:
                                                                  'Petang')));
                                            },
                                          ),
                                        ],
                                      ),
                                    ));
                          },
                        ),
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Text(
                        "Al-Ma'tsurat",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  // Fitur(
                  //   title: ,
                  //   icon: ,
                  //   file: DzikirPagi(
                  //     title: 'Pagi',
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
          // SizedBox.expand(
          //   child: GestureDetector(onVerticalDragUpdate: (details) {
          //     int sensitivity = 8;
          //     if (details.delta.dy < -sensitivity) {
          //       // Up Swipe
          //       SlidingUpPanel(
          //         panel: Center(
          //           child: Text("This is the sliding Widget"),
          //         ),
          //       );

          //       print('swipe up');
          //     }
          //   }),
          // ),
          // SlidingUpPanel(
          //   backdropEnabled: true,
          //   borderRadius: radius,
          //   collapsed: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: radius,
          //       color: Color(0xFF272A35),
          //     ),
          //     child: Center(
          //       child: Text(
          //         "Chatbot",
          //         style: TextStyle(color: Colors.white),
          //       ),
          //     ),
          //   ),
          //   panel: Center(
          //     child: Text(
          //       "COMING SOON",
          //       style: TextStyle(color: Colors.black),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

// Future<HomePage> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw Exception('Could not launch $_url');
//   }
// }

class MapUtils {
  MapUtils._();

  static Future<void> openMap() async {
    String googleUrl = 'https://www.google.co.id/maps/search/masjid';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}

class JadwalS extends StatefulWidget {
  const JadwalS({
    super.key,
  });

  @override
  State<JadwalS> createState() => _JadwalSState();
}

class _JadwalSState extends State<JadwalS> {
  String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    // showDialog(
    //   context: context,
    //   barrierDismissible: false,
    //   builder: (context) => Center(
    //     child: CircularProgressIndicator(),
    //   ),
    // );
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    // navigatorKey.currentState!.popUntil((route) => route.isFirst);
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = '${place.subLocality}';
        // '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  // String? gambar;
  @override
  Widget build(BuildContext context) {
    _getCurrentPosition();
    String? dtsholats;
    DateTime? dtsholat;
    double? lat = _currentPosition!.latitude;
    double? long = _currentPosition!.longitude;
    // DateTime thresshold1 = DateTime.parse("18:00:00");
    // DateTime thresshold2 = DateTime.parse("06:00:00");
    DateTime? dtn = DateTime.now();
    DateTime? dtsubuh = PrayerTimes.today(
            Coordinates(lat, long), CalculationMethod.singapore.getParameters())
        .fajr;
    DateTime? dtzuhur = PrayerTimes.today(
            Coordinates(lat, long), CalculationMethod.singapore.getParameters())
        .dhuhr;
    DateTime? dtasar = PrayerTimes.today(
            Coordinates(lat, long), CalculationMethod.singapore.getParameters())
        .asr;
    DateTime? dtmagrib = PrayerTimes.today(
            Coordinates(lat, long), CalculationMethod.singapore.getParameters())
        .maghrib;
    DateTime? dtisya = PrayerTimes.today(
            Coordinates(lat, long), CalculationMethod.singapore.getParameters())
        .isha;
    if (dtn.isBefore(dtsubuh)) {
      dtsholat = dtsubuh;
      dtsholats = 'Subuh';
    } else if (dtn.isBefore(dtzuhur)) {
      dtsholat = dtzuhur;
      dtsholats = 'Zuhur';
    } else if (dtn.isBefore(dtasar)) {
      dtsholat = dtasar;
      dtsholats = 'Ashar';
    } else if (dtn.isBefore(dtmagrib)) {
      dtsholat = dtmagrib;
      dtsholats = 'Magrib';
    } else if (dtn.isBefore(dtisya)) {
      dtsholat = dtisya;
      dtsholats = 'Isya';
    } else if (dtn.isAfter(dtisya)) {
      dtsholat = dtsubuh;
      dtsholats = 'Subuh';
    }
    String? gambar;
    DateTime? skrg = DateTime.now();
    if (int.parse(skrg.hour.toString()) < 18 &&
        int.parse(skrg.hour.toString()) > 6) {
      gambar = 'sources/clouds.jpg';
    } else {
      gambar = 'sources/bg.jpg';
    }
    return Stack(
      children: [
        // Image.asset('sources/clouds.jpg', opacity: ,),
        Opacity(
          opacity: 0.6,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20)),
            child: Image.asset(
              gambar,
            ),
          ),
        ),
        // Container(
        //   // clipper: ClipPathClass(),
        //   width: 400,
        //   // child: ClipRRect(
        //   //   borderRadius: BorderRadius.only(
        //   //       bottomRight: Radius.circular(20),
        //   //       bottomLeft: Radius.circular(20)),
        //   child: Image.asset('sources/clouds.jpg'),
        //   // ),
        // ),
        // SizedBox(
        //   height: 20,
        //   width: 20,
        // ),
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  DateFormat?.yMMMMEEEEd().format(DateTime.now()).toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Text(
                  HijriCalendar.now().toFormat("dd MMMM yyyy"),
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  // dtsholats.toString()
                  dtsholats.toString(),
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  // dtsholat.toString()
                  DateFormat?.Hm().format(dtsholat!).toString(),
                  // 'tes',
                  style: TextStyle(
                      fontSize: 42,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: _getCurrentPosition,
                  icon: const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    '${_currentAddress ?? ""}',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            // SizedBox(
            //   height: 15,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                JadwalSholat(
                    jadwal: 'Subuh',
                    waktu: DateFormat?.Hm().format(dtsubuh).toString()),
                // SizedBox(
                //   width: 2,
                // ),
                JadwalSholat(
                    jadwal: 'Terbit',
                    waktu: DateFormat?.Hm()
                        .format(PrayerTimes.today(Coordinates(lat, long),
                                CalculationMethod.singapore.getParameters())
                            .sunrise)
                        .toString()),
                // SizedBox(
                //   width: 25,
                // ),
                JadwalSholat(
                    jadwal: 'Zuhur',
                    waktu: DateFormat?.Hm().format(dtzuhur).toString()),
                // SizedBox(
                //   width: 25,
                // ),
                JadwalSholat(
                    jadwal: 'Ashar',
                    waktu: DateFormat?.Hm().format(dtasar).toString()),
                // SizedBox(
                //   width: 25,
                // ),
                JadwalSholat(
                    jadwal: 'Magrib',
                    waktu: DateFormat?.Hm().format(dtmagrib).toString()),
                // SizedBox(
                //   width: 25,
                // ),
                JadwalSholat(
                    jadwal: 'Isya',
                    waktu: DateFormat?.Hm().format(dtisya).toString()),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class chatbot extends StatelessWidget {
  const chatbot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SlidingUpPanelExample"),
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: Text("This is the Widget behind the sliding panel"),
            ),
            SlidingUpPanel(
              panel: Center(
                child: Text("This is the sliding Widget"),
              ),
            )
          ],
        ));
  }
}

class Fitur extends StatelessWidget {
  const Fitur({
    Key? key,
    required this.title,
    required this.icon,
    required this.file,
  }) : super(key: key);

  final String title;
  final String icon;
  final file;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          child: IconButton(
            // width: 90,
            // height: 90,
            icon: Image.asset(
              icon,
              fit: BoxFit.cover,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => file));
            },
          ),
        ),
        // SizedBox(
        //   height: 5,
        // ),
        Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}

class JadwalSholat extends StatelessWidget {
  const JadwalSholat({
    Key? key,
    required this.jadwal,
    required this.waktu,
  }) : super(key: key);

  final String jadwal;
  final String waktu;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 2,
        ),
        Text(
          jadwal,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          waktu,
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }
}
// class ClipPathClass extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height - 60);

//     path.quadraticBezierTo(
//       size.width / 2,
//       size.height,
//       size.width,
//       size.height - 60,
//     );

//     path.lineTo(size.width, 0);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// }

// class JadwalS extends StatefulWidget {
//   const JadwalS({
//     super.key,
//   });

//   @override
//   State<JadwalS> createState() => _JadwalSState();
// }

// class _JadwalSState extends State<JadwalS> {
//   String? _currentAddress;
//   Position? _currentPosition;

//   Future<bool> _handleLocationPermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location services are disabled. Please enable the services')));
//       return false;
//     }
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text('Location permissions are denied')));
//         return false;
//       }
//     }
//     if (permission == LocationPermission.deniedForever) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text(
//               'Location permissions are permanently denied, we cannot request permissions.')));
//       return false;
//     }
//     return true;
//   }

//   Future<void> _getCurrentPosition() async {
//     // final formKey = GlobalKey<FormState>();
//     final hasPermission = await _handleLocationPermission();
//     // final isValid = formKey.currentState!.validate();
//     if (!hasPermission) return;
//     // showDialog(
//     //   context: context,
//     //   barrierDismissible: true,
//     //   builder: (context) => Center(
//     //     child: CircularProgressIndicator(),
//     //   ),
//     // );
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low)
//         .then((Position position) {
//       setState(() => _currentPosition = position);
//       _getAddressFromLatLng(_currentPosition!);
//     }).catchError((e) {
//       debugPrint(e);
//     });

//     // navigatorKey.currentState!.popUntil((route) => route.isFirst);
//   }

//   Future<void> _getAddressFromLatLng(Position position) async {
//     await placemarkFromCoordinates(
//             _currentPosition!.latitude, _currentPosition!.longitude)
//         .then((List<Placemark> placemarks) {
//       Placemark place = placemarks[0];
//       setState(() {
//         _currentAddress = '${place.subLocality}';
//         // '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }

//   // String? gambar;
//   @override
//   Widget build(BuildContext context) {
//     _getCurrentPosition();
//     String waktuS;
//     String waktuZ;
//     String waktuA;
//     String waktuM;
//     String waktuI;
//     String waktuT;
//     String waktuN;

//     String? dtsholats;
//     String? dtsholat;
//     double lat = _currentPosition!.latitude;
//     double long = _currentPosition!.longitude;
//     DateTime dtn = DateTime.now();
//     DateTime dtsubuh = PrayerTimes.today(
//             Coordinates(lat, long), CalculationMethod.singapore.getParameters())
//         .fajr;
//     DateTime dtzuhur = PrayerTimes.today(
//             Coordinates(lat, long), CalculationMethod.singapore.getParameters())
//         .dhuhr;
//     DateTime dtasar = PrayerTimes.today(
//             Coordinates(lat, long), CalculationMethod.singapore.getParameters())
//         .asr;
//     DateTime dtmagrib = PrayerTimes.today(
//             Coordinates(lat, long), CalculationMethod.singapore.getParameters())
//         .maghrib;
//     DateTime dtisya = PrayerTimes.today(
//             Coordinates(lat, long), CalculationMethod.singapore.getParameters())
//         .isha;
//     if (dtn.isBefore(dtsubuh)) {
//       dtsholat = DateFormat?.Hm().format(dtsubuh).toString();

//       dtsholats = 'Subuh';
//     } else if (dtn.isBefore(dtzuhur)) {
//       dtsholat = DateFormat?.Hm().format(dtzuhur).toString();

//       dtsholats = 'Zuhur';
//     } else if (dtn.isBefore(dtasar)) {
//       dtsholat = DateFormat?.Hm().format(dtasar).toString();

//       dtsholats = 'Ashar';
//     } else if (dtn.isBefore(dtmagrib)) {
//       dtsholat = DateFormat?.Hm().format(dtmagrib).toString();

//       dtsholats = 'Magrib';
//     } else if (dtn.isBefore(dtisya)) {
//       dtsholat = DateFormat?.Hm().format(dtisya).toString();

//       dtsholats = 'Isya';
//     } else if (dtn.isAfter(dtisya)) {
//       dtsholat = DateFormat?.Hm().format(dtsubuh).toString();

//       dtsholats = 'Subuh';
//     }

//     if (_handleLocationPermission() == false) {
//       waktuS = 'Loading';
//       waktuZ = 'Loading';
//       waktuA = 'Loading';
//       waktuM = 'Loading';
//       waktuI = 'Loading';
//       waktuT = 'Loading';
//       waktuN = 'Loading';
//     } else {
//       waktuS = DateFormat?.Hm().format(dtsubuh).toString();
//       waktuZ = DateFormat?.Hm().format(dtzuhur).toString();
//       waktuA = DateFormat?.Hm().format(dtasar).toString();
//       waktuM = DateFormat?.Hm().format(dtmagrib).toString();
//       waktuI = DateFormat?.Hm().format(dtisya).toString();
//       waktuT = DateFormat?.Hm()
//           .format(PrayerTimes.today(Coordinates(lat, long),
//                   CalculationMethod.singapore.getParameters())
//               .sunrise)
//           .toString();
//       waktuN = dtsholat!;
//     }

//     // DateTime thresshold1 = DateTime.parse("18:00:00");
//     // DateTime thresshold2 = DateTime.parse("06:00:00");

//     String? gambar;
//     DateTime? skrg = DateTime.now();
//     if (int.parse(skrg.hour.toString()) < 18 &&
//         int.parse(skrg.hour.toString()) > 6) {
//       gambar = 'sources/clouds.jpg';
//     } else {
//       gambar = 'sources/bg.jpg';
//     }
//     return Stack(
//       children: [
//         // Image.asset('sources/clouds.jpg', opacity: ,),
//         Opacity(
//           opacity: 0.6,
//           child: ClipRRect(
//             borderRadius: BorderRadius.only(
//                 bottomRight: Radius.circular(20),
//                 bottomLeft: Radius.circular(20)),
//             child: Image.asset(
//               gambar,
//             ),
//           ),
//         ),
//         // Container(
//         //   // clipper: ClipPathClass(),
//         //   width: 400,
//         //   // child: ClipRRect(
//         //   //   borderRadius: BorderRadius.only(
//         //   //       bottomRight: Radius.circular(20),
//         //   //       bottomLeft: Radius.circular(20)),
//         //   child: Image.asset('sources/clouds.jpg'),
//         //   // ),
//         // ),
//         // SizedBox(
//         //   height: 20,
//         //   width: 20,
//         // ),
//         Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   DateFormat?.yMMMMEEEEd().format(DateTime.now()).toString(),
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   HijriCalendar.now().toFormat("dd MMMM yyyy"),
//                   style: TextStyle(fontSize: 14, color: Colors.white),
//                 ),
//               ],
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   // dtsholats.toString()
//                   dtsholats!,
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//                 SizedBox(
//                   height: 2,
//                 ),
//                 Text(
//                   // dtsholat.toString()
//                   waktuN,
//                   // 'tes',
//                   style: TextStyle(
//                       fontSize: 42,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 TextButton.icon(
//                   onPressed: _getCurrentPosition,
//                   icon: const Icon(
//                     Icons.location_on_outlined,
//                     color: Colors.white,
//                   ),
//                   label: Text(
//                     '${_currentAddress ?? ""}',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )
//               ],
//             ),
//             // SizedBox(
//             //   height: 15,
//             // ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 JadwalSholat(jadwal: 'Subuh', waktu: waktuS),
//                 // SizedBox(
//                 //   width: 2,
//                 // ),
//                 JadwalSholat(jadwal: 'Terbit', waktu: waktuT),
//                 // SizedBox(
//                 //   width: 25,
//                 // ),
//                 JadwalSholat(jadwal: 'Zuhur', waktu: waktuZ),
//                 // SizedBox(
//                 //   width: 25,
//                 // ),
//                 JadwalSholat(jadwal: 'Ashar', waktu: waktuA),
//                 // SizedBox(
//                 //   width: 25,
//                 // ),
//                 JadwalSholat(jadwal: 'Magrib', waktu: waktuM),
//                 // SizedBox(
//                 //   width: 25,
//                 // ),
//                 JadwalSholat(jadwal: 'Isya', waktu: waktuI),
//               ],
//             )
//           ],
//         ),
//       ],
//     );
//   }
// }

// class chatbot extends StatelessWidget {
//   const chatbot({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("SlidingUpPanelExample"),
//         ),
//         body: Stack(
//           children: <Widget>[
//             Center(
//               child: Text("This is the Widget behind the sliding panel"),
//             ),
//             SlidingUpPanel(
//               panel: Center(
//                 child: Text("This is the sliding Widget"),
//               ),
//             )
//           ],
//         ));
//   }
// }

// class Fitur extends StatelessWidget {
//   const Fitur({
//     Key? key,
//     required this.title,
//     required this.icon,
//     required this.file,
//   }) : super(key: key);

//   final String title;
//   final String icon;
//   final file;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           width: 100,
//           height: 100,
//           child: IconButton(
//             // width: 90,
//             // height: 90,
//             icon: Image.asset(
//               icon,
//               fit: BoxFit.cover,
//             ),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (_) => file));
//             },
//           ),
//         ),
//         // SizedBox(
//         //   height: 5,
//         // ),
//         Text(
//           title,
//           style: TextStyle(fontSize: 16, color: Colors.white),
//         ),
//       ],
//     );
//   }
// }

// class JadwalSholat extends StatelessWidget {
//   const JadwalSholat({
//     Key? key,
//     required this.jadwal,
//     required this.waktu,
//   }) : super(key: key);

//   final String jadwal;
//   final String waktu;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: 2,
//         ),
//         Text(
//           jadwal,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.white,
//           ),
//         ),
//         SizedBox(
//           height: 2,
//         ),
//         Text(
//           waktu,
//           style: TextStyle(fontSize: 14, color: Colors.white),
//         ),
//       ],
//     );
//   }
// }
// // class ClipPathClass extends CustomClipper<Path> {
// //   @override
// //   Path getClip(Size size) {
// //     Path path = Path();
// //     path.lineTo(0, size.height - 60);

// //     path.quadraticBezierTo(
// //       size.width / 2,
// //       size.height,
// //       size.width,
// //       size.height - 60,
// //     );

// //     path.lineTo(size.width, 0);
// //     path.close();

// //     return path;
// //   }

// //   @override
// //   bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
// // }
