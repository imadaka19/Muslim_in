import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class QiblahScreen extends StatefulWidget {
  const QiblahScreen({super.key});

  @override
  State<QiblahScreen> createState() => _QiblahScreenState();
}

Animation<double>? animation;
AnimationController? _animationController;
double begin = 0.0;

class _QiblahScreenState extends State<QiblahScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        title: SizedBox(
            child: Text(
          "QIBLAT",
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
        children: [
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
          StreamBuilder(
            stream: FlutterQiblah.qiblahStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ));
              }

              final qiblahDirection = snapshot.data;
              animation = Tween(
                      begin: begin,
                      end: (qiblahDirection!.qiblah * (pi / 180) * -1))
                  .animate(_animationController!);
              begin = (qiblahDirection.qiblah * (pi / 180) * -1);
              _animationController!.forward(from: 0);

              return Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 300,
                        child: AnimatedBuilder(
                          animation: animation!,
                          builder: (context, child) => Transform.rotate(
                              angle: animation!.value,
                              child: Image.asset('sources/fitur/Qiblat.png')),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 100,
                            // color: Color(0xFFD0E1F9),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFD0E1F9),
                            ),
                          ),
                          Text(
                            "${qiblahDirection.direction.toInt()}°",
                            style: const TextStyle(
                                color: Color(0xFF373E4E), fontSize: 24),
                          ),
                        ],
                      ),
                    ]),
              );
            },
          ),
        ],
      ),
    );
  }
}
