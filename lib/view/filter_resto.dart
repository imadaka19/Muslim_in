// import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:muslim_in/read_data/filter_select.dart';

const List<Widget> kategoriList = <Widget>[
  Text(
    'Halal Certified',
    style: TextStyle(
      fontSize: 12,
    ),
  ),
  Text(
    'Self Certified',
    style: TextStyle(
      fontSize: 12,
    ),
  ),
];

const List<Widget> kotaList = <Widget>[
  Text(
    "Busan",
    style: TextStyle(
      fontSize: 12,
    ),
  ),
  Text(
    "Daegu",
    style: TextStyle(fontSize: 12),
  ),
  Text(
    "Gyeonggi-do",
    style: TextStyle(fontSize: 12),
  ),
  Text(
    "Incheon",
    style: TextStyle(fontSize: 12),
  ),
  Text(
    "Jeju-do",
    style: TextStyle(fontSize: 12),
  ),
  Text(
    "Seoul",
    style: TextStyle(fontSize: 12),
  ),
];

List<String> filterKota = [
  "Busan",
  "Daegu",
  "Gyeonggi-do",
  "Incheon",
  "Jeju-do",
  "Seoul"
];

List<String> filterKategori = [
  "Halal Certified",
  "Self Certified",
];

String? pilihanKota;
String? pilihanKategori;

// class FilterResto extends StatefulWidget {
//   const FilterResto({super.key});

//   @override
//   State<FilterResto> createState() => _FilterRestoState();
// }

// class _FilterRestoState extends State<FilterResto> {
//   // var controller = Get.put(SelectedListController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // label: Text(
//         //   'Filter',
//         //   style: TextStyle(color: Color(0xffD0E1F9), fontSize: 14),
//         // ),
//         // icon: Icon(
//         //   Icons.tune,
//         //   color: Color(0xffD0E1F9),
//         // ),
//         // style: ElevatedButton.styleFrom(
//         //     primary: Color(0xff1E1F26),
//         //     // elevation: 0,
//         //     fixedSize: Size(100, 50),
//         //     shape: RoundedRectangleBorder(
//         //         borderRadius: BorderRadius.all(Radius.circular(10)))),
//         // onPressed: () {
//         //   showModalBottomSheet(
//         //     backgroundColor: Color(0xff1E1F26),
//         //     context: context,
//         //     shape:
//         //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//         //     builder: (context) => SizedBox(
//         //       height: 300,
//         //       child: Padding(
//         //         padding: const EdgeInsets.all(30.0),
//         //         child: ListView(
//         //           // mainAxisAlignment: MainAxisAlignment.start,
//         //           children: [
//         //             // SizedBox(
//         //             //   height: 5,
//         //             // ),
//         //             Text(
//         //               "Kategori",
//         //               style: TextStyle(
//         //                   fontSize: 14,
//         //                   color: Color(0xffD0E1F9),
//         //                   fontWeight: FontWeight.bold),
//         //             ),
//         //             SizedBox(
//         //               height: 5,
//         //             ),
//         //             Row(
//         //               children: [
//         //                 OutlinedButton(
//         //                   onPressed: () {
//         //                     pilihanKategori = "Halal Certified";
//         //                   },
//         //                   child: Text(
//         //                     'Halal Certified',
//         //                     style:
//         //                         TextStyle(fontSize: 12, color: Color(0xffD0E1F9)),
//         //                   ),
//         //                   style: OutlinedButton.styleFrom(
//         //                     surfaceTintColor: Color(0xffD0E1F9),
//         //                     side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
//         //                     fixedSize: Size(110, 30),
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.all(Radius.circular(25)),
//         //                     ),
//         //                   ),
//         //                 ),
//         //                 SizedBox(
//         //                   width: 5,
//         //                 ),
//         //                 OutlinedButton(
//         //                   onPressed: () {
//         //                     pilihanKategori = "Self Certified";
//         //                   },
//         //                   child: Text(
//         //                     'Self Certified',
//         //                     style:
//         //                         TextStyle(fontSize: 12, color: Color(0xffD0E1F9)),
//         //                   ),
//         //                   style: OutlinedButton.styleFrom(
//         //                     surfaceTintColor: Color(0xffD0E1F9),
//         //                     side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
//         //                     fixedSize: Size(110, 30),
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.all(Radius.circular(25)),
//         //                     ),
//         //                   ),
//         //                 ),
//         //               ],
//         //             ),
//         //             SizedBox(
//         //               height: 5,
//         //             ),
//         //             Text(
//         //               "Kota",
//         //               style: TextStyle(
//         //                   fontSize: 14,
//         //                   color: Color(0xffD0E1F9),
//         //                   fontWeight: FontWeight.bold),
//         //             ),
//         //             SizedBox(
//         //               height: 5,
//         //             ),
//         //             Row(
//         //               children: [
//         //                 OutlinedButton(
//         //                   onPressed: () {
//         //                     pilihanKota = filterKota[0];
//         //                   },
//         //                   child: Text(
//         //                     'Busan',
//         //                     style:
//         //                         TextStyle(fontSize: 12, color: Color(0xffD0E1F9)),
//         //                   ),
//         //                   style: OutlinedButton.styleFrom(
//         //                     surfaceTintColor: Color(0xffD0E1F9),
//         //                     side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
//         //                     fixedSize: Size(70, 30),
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.all(Radius.circular(25)),
//         //                     ),
//         //                   ),
//         //                 ),
//         //                 SizedBox(
//         //                   width: 5,
//         //                 ),
//         //                 OutlinedButton(
//         //                   onPressed: () {
//         //                     pilihanKota = filterKota[1];
//         //                   },
//         //                   child: Text(
//         //                     'Daegu',
//         //                     style:
//         //                         TextStyle(fontSize: 12, color: Color(0xffD0E1F9)),
//         //                   ),
//         //                   style: OutlinedButton.styleFrom(
//         //                     surfaceTintColor: Color(0xffD0E1F9),
//         //                     side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
//         //                     fixedSize: Size(70, 30),
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.all(Radius.circular(25)),
//         //                     ),
//         //                   ),
//         //                 ),
//         //                 SizedBox(
//         //                   width: 5,
//         //                 ),
//         //                 OutlinedButton(
//         //                   onPressed: () {
//         //                     pilihanKota = filterKota[2];
//         //                   },
//         //                   child: Text(
//         //                     'Gyeonggi-do',
//         //                     style:
//         //                         TextStyle(fontSize: 12, color: Color(0xffD0E1F9)),
//         //                   ),
//         //                   style: OutlinedButton.styleFrom(
//         //                     surfaceTintColor: Color(0xffD0E1F9),
//         //                     side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
//         //                     fixedSize: Size(110, 30),
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.all(Radius.circular(25)),
//         //                     ),
//         //                   ),
//         //                 ),
//         //                 SizedBox(
//         //                   width: 5,
//         //                 ),
//         //               ],
//         //             ),
//         //             // SizedBox(
//         //             //   height: 5,
//         //             // ),
//         //             Row(
//         //               children: [
//         //                 OutlinedButton(
//         //                   onPressed: () {
//         //                     pilihanKota = filterKota[3];
//         //                   },
//         //                   child: Text(
//         //                     'Incheon',
//         //                     style:
//         //                         TextStyle(fontSize: 12, color: Color(0xffD0E1F9)),
//         //                   ),
//         //                   style: OutlinedButton.styleFrom(
//         //                     surfaceTintColor: Color(0xffD0E1F9),
//         //                     side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
//         //                     fixedSize: Size(80, 30),
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.all(Radius.circular(25)),
//         //                     ),
//         //                   ),
//         //                 ),
//         //                 SizedBox(
//         //                   width: 5,
//         //                 ),
//         //                 OutlinedButton(
//         //                   onPressed: () {
//         //                     pilihanKota = filterKota[4];
//         //                   },
//         //                   child: Text(
//         //                     'Jeju-do',
//         //                     style:
//         //                         TextStyle(fontSize: 12, color: Color(0xffD0E1F9)),
//         //                   ),
//         //                   style: OutlinedButton.styleFrom(
//         //                     surfaceTintColor: Color(0xffD0E1F9),
//         //                     side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
//         //                     fixedSize: Size(90, 30),
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.all(Radius.circular(25)),
//         //                     ),
//         //                   ),
//         //                 ),
//         //                 SizedBox(
//         //                   width: 5,
//         //                 ),
//         //                 OutlinedButton(
//         //                   onPressed: () {
//         //                     pilihanKota = filterKota[5];
//         //                   },
//         //                   child: Text(
//         //                     'Seoul',
//         //                     style:
//         //                         TextStyle(fontSize: 12, color: Color(0xffD0E1F9)),
//         //                   ),
//         //                   style: OutlinedButton.styleFrom(
//         //                     surfaceTintColor: Color(0xffD0E1F9),
//         //                     side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
//         //                     fixedSize: Size(70, 30),
//         //                     shape: RoundedRectangleBorder(
//         //                       borderRadius: BorderRadius.all(Radius.circular(25)),
//         //                     ),
//         //                   ),
//         //                 ),
//         //               ],
//         //             ),
//         //             SizedBox(
//         //               height: 5,
//         //             ),
//         //             FilledButton(
//         //               child: Text(
//         //                 "Apply",
//         //                 style: TextStyle(
//         //                     color: Color(0xff1E1F26),
//         //                     fontSize: 14,
//         //                     fontWeight: FontWeight.bold),
//         //               ),
//         //               style: ElevatedButton.styleFrom(
//         //                   primary: Color(0xffD0E1F9),
//         //                   elevation: 0,
//         //                   fixedSize: Size(130, 30),
//         //                   shape: RoundedRectangleBorder(
//         //                       borderRadius:
//         //                           BorderRadius.all(Radius.circular(25)))),
//         //               onPressed: () {
//         //                 setState(() {});
//         //               },
//         //             ),
//         //           ],
//         //         ),
//         //       ),
//         //     ),
//         //   );
//         // },
//         );
//   }
// }
