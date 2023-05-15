import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class getRestoAlamat extends StatelessWidget {
  final String documentId;

  getRestoAlamat({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference resto = FirebaseFirestore.instance.collection('resto');
    return FutureBuilder<DocumentSnapshot>(
        future: resto.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              "${data['Alamat']}",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            );
          }
          return Text(
            "Loading..",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          );
        }));
  }
}

class getRestoKategori extends StatelessWidget {
  final String documentId;

  getRestoKategori({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference resto = FirebaseFirestore.instance.collection('resto');
    return FutureBuilder<DocumentSnapshot>(
        future: resto.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              "${data['Kategori']}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            );
          }
          return Text(
            "Loading..",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          );
        }));
  }
}

class getRestoKota extends StatelessWidget {
  final String documentId;

  getRestoKota({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference resto = FirebaseFirestore.instance.collection('resto');
    return FutureBuilder<DocumentSnapshot>(
        future: resto.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              "${data['Kota']}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            );
          }
          return Text(
            "Loading..",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          );
        }));
  }
}

// _getGender(String documentId) async {
//   // ref is '/gender/Girl/' in your case
//   var query = await FirebaseFirestore.instance
//       .collection('resto')
//       .doc(documentId)
//       .get();
//   // print('color is: ' + )
//   return query.data['Link'];
// }
// class MapUtils {

//   String? documentId;

//   MapUtils({required this.documentId});
//   static Future<void> openMap() async {

//     if (await canLaunchUrl(Uri.parse(documentId))) {
//       await launchUrl(Uri.parse(documentId));
//     } else {
//       throw 'Could not open the map.';
//     }
//   }
// }

// class getRestoLink extends StatelessWidget {
//   final String documentId;

//   getRestoLink({required this.documentId});
//   // @override
//   // Widget build(BuildContext context) {
//   //   CollectionReference resto = FirebaseFirestore.instance.collection('resto');
//   //   return FutureBuilder<DocumentSnapshot>(
//   //       future: resto.doc(documentId).get(),
//   //       builder: ((context, snapshot) {
//   //         if (snapshot.connectionState == ConnectionState.done) {
//   //           Map<String, dynamic> data =
//   //               snapshot.data!.data() as Map<String, dynamic>;
//   //           return data['Link'];
//   //         }
//   //         return Container();
//   //         ;
//   //       }));
//   // }

//   // Future<String> get restoLink async {
//   //   await FirebaseFirestore.instance
//   //       .collection('resto')
//   //       .doc(documentId)
//   //       .get()
//   //       .then((snapshot) {
//   //     if (snapshot.exists) {
//   //       Map<String, dynamic> data =
//   //               snapshot.data.data() as Map<String, dynamic>;
//   //       String linknya = data['Link'];
//   //       return linknya;
//   //     }
//   //   });
//   //   return 'No User';
//   // }
//   // Future<String?> getLink(String documentId) async {
//   //   DocumentReference documentReference =
//   //       FirebaseFirestore.instance.collection('resto').doc(documentId);
//   //   // CollectionReference resto = FirebaseFirestore.instance.collection('resto');
//   //   String? linknya;
//   //   await documentReference.get().then((value) {
//   //     linknya = value.data().toString();
//   //   });
//   //   return linknya;
//   // }
//   // Future getData() async {

//     // return resto.doc(documentId).field['Link'];

//   //   return FutureBuilder<DocumentSnapshot>(
//   //       future: resto.doc(documentId).get(),
//   //       builder: ((context, snapshot) {
//   //         if (snapshot.connectionState == ConnectionState.done) {
//   //           Map<String, dynamic> data =
//   //               snapshot.data!.data() as Map<String, dynamic>;

//   //         }
//   //         return Text("Loading..");
//   //       }));
//   // }
// }

// Future<String> _getLink(documentId) async {
//   // ref is '/gender/Girl/' in your case
//   var query = await FirebaseFirestore.instance.doc(documentId).get();
//   return query.get('Link');
// }

class getRestoTelp extends StatelessWidget {
  final String documentId;

  getRestoTelp({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference resto = FirebaseFirestore.instance.collection('resto');
    return FutureBuilder<DocumentSnapshot>(
        future: resto.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              "${data['Telepon']}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              ),
            );
          }
          return Text(
            "Loading..",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          );
        }));
  }
}

class getRestoNama extends StatelessWidget {
  final String documentId;

  getRestoNama({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference resto = FirebaseFirestore.instance.collection('resto');
    return FutureBuilder<DocumentSnapshot>(
        future: resto.doc(documentId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              "${data['Nama']}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            );
          }
          return Text(
            "Loading..",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          );
        }));
  }
}
