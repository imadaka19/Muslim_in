import 'package:customtogglebuttons/customtogglebuttons.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:muslim_in/view/filter_resto.dart';
import 'package:muslim_in/view/resto_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_storage/firebase_storage.dart';

// Bool
class Resto extends StatefulWidget {
  const Resto({super.key});

  @override
  State<Resto> createState() => _RestoState();
}

class _RestoState extends State<Resto> {
  String name = '';
  List<bool> _selectedKota = <bool>[
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> _selectedKategori = <bool>[
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            child: Text(
          "KOREA SELATAN",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFD0E1F9)),
        )),
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
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
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
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: TextField(
                        style: TextStyle(
                          color: Color(0xffD0E1F9),
                        ),
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.search,
                            color: Color(0xffD0E1F9),
                          ),
                          hoverColor: Color(0xffD0E1F9),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          labelText: 'Search Resto Name',
                          labelStyle: TextStyle(
                            color: Color(0xffD0E1F9),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  width: 2, color: Color(0xffD0E1F9))),
                          // prefixIcon: Icon(
                          //   Icons.email,
                          //   color: Color(0xffD0E1F9),
                          // )
                        ),
                        onChanged: ((val) {
                          setState(() {
                            name = val;
                          });
                        }),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    FilledButton.icon(
                      label: Text(
                        'Filter',
                        style:
                            TextStyle(color: Color(0xffD0E1F9), fontSize: 14),
                      ),
                      icon: Icon(
                        Icons.tune,
                        color: Color(0xffD0E1F9),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff1E1F26),
                          // elevation: 0,
                          fixedSize: Size(100, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: Color(0xff1E1F26),
                          context: context,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          builder: (context) => SizedBox(
                            height: 280,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ListView(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Kategori',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffD0E1F9),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),

                                  ToggleButtons(
                                    direction: Axis.horizontal,
                                    onPressed: (int index) {
                                      // All buttons are selectable.
                                      setState(() {
                                        for (int i = 0;
                                            i < _selectedKategori.length;
                                            i++) {
                                          _selectedKategori[i] = i == index;
                                          pilihanKategori =
                                              filterKategori[index];
                                        }
                                        // _selectedKategori[index] =
                                        //     !_selectedKategori[index];
                                        // pilihanKategori = filterKategori[index];
                                      });
                                    },
                                    borderRadius: BorderRadius.circular(20),
                                    selectedBorderColor: Color(0xffD0E1F9),
                                    selectedColor: Colors.black,
                                    fillColor: Color(0xffD0E1F9),
                                    color: Color(0xffD0E1F9),
                                    borderColor: Color(0xffD0E1F9),
                                    // spacing: 5.0,
                                    constraints: const BoxConstraints(
                                      minHeight: 40.0,
                                      minWidth: 100.0,
                                    ),
                                    isSelected: _selectedKategori,
                                    children: kategoriList,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Kota',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xffD0E1F9),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: ToggleButtons(
                                      direction: Axis.horizontal,
                                      onPressed: (int index) {
                                        // All buttons are selectable.
                                        setState(() {
                                          for (int i = 0;
                                              i < _selectedKota.length;
                                              i++) {
                                            _selectedKota[i] = i == index;
                                            pilihanKota = filterKota[index];
                                          }
                                          // _selectedKota[index] =
                                          //     !_selectedKota[index];
                                          // pilihanKota = filterKota[index];
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(20),
                                      selectedBorderColor: Color(0xffD0E1F9),
                                      selectedColor: Colors.black,
                                      fillColor: Color(0xffD0E1F9),
                                      color: Color(0xffD0E1F9),
                                      borderColor: Color(0xffD0E1F9),
                                      // spacing: 10.0,
                                      constraints: const BoxConstraints(
                                        minHeight: 40.0,
                                        minWidth: 80.0,
                                      ),
                                      isSelected: _selectedKota,
                                      children: kotaList,
                                    ),
                                  ),
                                  // const SizedBox(height: 20),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      FilledButton(
                                        child: Text(
                                          "Reset",
                                          style: TextStyle(
                                              color: Color(0xff1E1F26),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xffD0E1F9),
                                            elevation: 0,
                                            fixedSize: Size(130, 30),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)))),
                                        onPressed: () {
                                          _selectedKota = [
                                            false,
                                            false,
                                            false,
                                            false,
                                            false,
                                            false,
                                          ];
                                          _selectedKategori = <bool>[
                                            false,
                                            false,
                                          ];
                                          pilihanKategori = '';
                                          pilihanKota = '';
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                      ),
                                      FilledButton(
                                        child: Text(
                                          "Apply",
                                          style: TextStyle(
                                              color: Color(0xff1E1F26),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Color(0xffD0E1F9),
                                            elevation: 0,
                                            fixedSize: Size(130, 30),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(25)))),
                                        onPressed: () {
                                          setState(() {});
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                child: Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                      stream: (name != '' && name != null)
                          ? FirebaseFirestore.instance
                              .collection("resto")
                              .where("kata_kunci", arrayContains: name)
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection("resto")
                              .snapshots(),
                      builder: (context, snapshot) {
                        return (snapshot.connectionState ==
                                ConnectionState.waiting)
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot data =
                                      snapshot.data!.docs[index];
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 20.0, 10.0, 10.0),
                                    child: Row(children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        child: Container(
                                          height: 170,
                                          width: 300,
                                          color: Colors.grey,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                width: 300,
                                                child: FutureBuilder(
                                                    future: FireStoreDataBase(
                                                            documentId: data[
                                                                'path_gambar'])
                                                        .getData(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasError) {
                                                        return const Text(
                                                          "Something went wrong",
                                                        );
                                                      }
                                                      if (snapshot
                                                              .connectionState ==
                                                          ConnectionState
                                                              .done) {
                                                        return AspectRatio(
                                                            aspectRatio: 1,
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .fitWidth,
                                                              child: Image.network(
                                                                  snapshot.data
                                                                      .toString()),
                                                            ));
                                                      }
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }),
                                              ),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    height: 80,
                                                  ),
                                                  Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10),
                                                        ),
                                                        child: RestoModelH(
                                                            nama: data['Nama'],
                                                            alamat:
                                                                data['Alamat'],
                                                            telepon:
                                                                data['Telepon'],
                                                            kota: data['Kota'],
                                                            kategori: data[
                                                                'Kategori']),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              GestureDetector(
                                                onTap: () async {
                                                  FirebaseFirestore.instance
                                                      .collection('resto')
                                                      .doc(data['Nama'])
                                                      .get()
                                                      .then((data) async {
                                                    var dataReceive =
                                                        data['Link'];
                                                    return launchUrl(
                                                      Uri.parse(dataReceive),
                                                    );
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 0,
                                      ),
                                    ]),
                                  );
                                },
                              );
                      }),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: (pilihanKota != '' &&
                            pilihanKota != null &&
                            pilihanKategori != '' &&
                            pilihanKategori != null)
                        ? FirebaseFirestore.instance
                            .collection("resto")
                            .where("Kota", isEqualTo: pilihanKota)
                            .where("Kategori", isEqualTo: pilihanKategori)
                            .snapshots()
                        : FirebaseFirestore.instance
                            .collection("resto")
                            .snapshots(),
                    builder: (context, snapshot) {
                      return (snapshot.connectionState ==
                              ConnectionState.waiting)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                DocumentSnapshot data =
                                    snapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                    child: Container(
                                      height: 120,
                                      color: Colors.white,
                                      child: Stack(
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              FirebaseFirestore.instance
                                                  .collection('resto')
                                                  .doc(data['Nama'])
                                                  .get()
                                                  .then((data) async {
                                                var dataReceive = data['Link'];
                                                return launchUrl(
                                                  Uri.parse(dataReceive),
                                                );
                                              });
                                            },
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              SizedBox(
                                                width: 10,
                                              ),
                                              ClipRRect(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(14),
                                                ),
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  child: FutureBuilder(
                                                      future: FireStoreDataBase(
                                                              documentId: data[
                                                                  'path_gambar'])
                                                          .getData(),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.hasError) {
                                                          return const Text(
                                                            "Something went wrong",
                                                          );
                                                        }
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .done) {
                                                          return AspectRatio(
                                                              aspectRatio: 1,
                                                              child: FittedBox(
                                                                fit:
                                                                    BoxFit.fill,
                                                                child: Image.network(
                                                                    snapshot
                                                                        .data
                                                                        .toString()),
                                                              ));
                                                        }
                                                        return const Center(
                                                            child:
                                                                CircularProgressIndicator());
                                                      }),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        top: 5,
                                                        bottom: 10),
                                                    // const EdgeInsets.fromLTRB(20, 0, 2, 2),
                                                    child: RestoModel(
                                                        nama: data['Nama'],
                                                        alamat: data['Alamat'],
                                                        telepon:
                                                            data['Telepon'],
                                                        kota: data['Kota'],
                                                        kategori:
                                                            data['Kategori'])),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FireStoreDataBase {
  final String documentId;
  FireStoreDataBase({required this.documentId});

  String? downloadURL;
  // String! link;
  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
    downloadURL =
        await FirebaseStorage.instance.ref().child(documentId).getDownloadURL();
    debugPrint(downloadURL.toString());
  }
}
