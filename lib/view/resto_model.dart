import 'package:flutter/material.dart';

class RestoModel extends StatelessWidget {
  const RestoModel({
    Key? key,
    required this.nama,
    required this.alamat,
    required this.telepon,
    required this.kota,
    required this.kategori,
  }) : super(key: key);

  final String nama;
  final String alamat;
  final String telepon;
  final String kota;
  final String kategori;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // SizedBox(
              //   width: 5,
              // ),
              Text(
                nama,
                maxLines: 1,
                style: TextStyle(
                    // color: Colors
                    //     .white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold),
              ),
              // const Padding(
              //     padding: EdgeInsets
              //         .only(
              //             bottom:
              //                 .0)),
              Text(
                alamat,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                telepon,
                maxLines: 2,
                style: TextStyle(
                  // color: Colors
                  //     .white,
                  fontSize: 12.0,
                ),
              ),
              Row(
                children: [
                  Text(
                    kota + ' - ' + kategori,
                    maxLines: 2,
                    style: TextStyle(
                      // color: Colors
                      //     .white,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RestoModelH extends StatelessWidget {
  const RestoModelH({
    Key? key,
    required this.nama,
    required this.alamat,
    required this.telepon,
    required this.kota,
    required this.kategori,
  }) : super(key: key);

  final String nama;
  final String alamat;
  final String telepon;
  final String kota;
  final String kategori;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 75,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(
                    //   width: 5,
                    // ),
                    Text(
                      nama,
                      maxLines: 1,
                      style: TextStyle(
                          // color: Colors
                          //     .white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                    // const Padding(
                    //     padding: EdgeInsets
                    //         .only(
                    //             bottom:
                    //                 .0)),
                    Text(
                      alamat,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Row(
                    children: [
                      Text(
                        telepon + ' | ' + kota + ' | ' + kategori,
                        // maxLines: 2,
                        style: TextStyle(
                          // color: Colors
                          //     .white,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
