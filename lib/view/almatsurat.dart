import 'package:flutter/material.dart';
import 'package:muslim_in/read_data/bacaan_dzikir.dart';
import 'package:muslim_in/read_data/constant.dart';

class DzikirPagi extends StatefulWidget {
  final String title;
  DzikirPagi({required this.title});

  @override
  _DzikirPagiState createState() => _DzikirPagiState();
}

class _DzikirPagiState extends State<DzikirPagi> {
  int pageIndex = 0;
  late int _counter;
  late String pageDesc;
  late String intro;
  late IconData icon;
  Dzikir bacaan = Dzikir();

  String _intro(int index) {
    if (index == 2 || index == 3 || index == 4) {
      return intro = '$kBasmalah\n';
    } else {
      return intro = '';
    }
  }

  void _initCounter(String input) {
    if (input == 'Pagi') {
      _counter = bacaan.dzikirPagi[pageIndex].jumlah;
    } else if (input == 'Petang') {
      _counter = bacaan.dzikirPetang[pageIndex].jumlah;
    } else {
      _counter = bacaan.dzikirShalat[pageIndex].jumlah;
    }
  }

  String _switcherJudul(String input) {
    if (input == 'Pagi') {
      return '${pageIndex + 1}- ${bacaan.dzikirPagi[pageIndex].judul} ${bacaan.dzikirPagi[pageIndex].jumlah}x';
    } else if (input == 'Petang') {
      return '${pageIndex + 1}- ${bacaan.dzikirPetang[pageIndex].judul} ${bacaan.dzikirPetang[pageIndex].jumlah}x';
    } else {
      return '${pageIndex + 1}- ${bacaan.dzikirShalat[pageIndex].judul} ${bacaan.dzikirShalat[pageIndex].jumlah}x';
    }
  }

  String _switcherAyat(String input) {
    if (input == 'Pagi') {
      return '${_intro(pageIndex)}${bacaan.dzikirPagi[pageIndex].ayat}';
    } else if (input == 'Petang') {
      return '${_intro(pageIndex)}${bacaan.dzikirPetang[pageIndex].ayat}';
    } else {
      return '${bacaan.dzikirShalat[pageIndex].ayat}';
    }
  }

  String _switcherTerjemah(String input) {
    if (input == 'Pagi') {
      return '${bacaan.dzikirPagi[pageIndex].terjemahan}';
    } else if (input == 'Petang') {
      return '${bacaan.dzikirPetang[pageIndex].terjemahan}';
    } else {
      return '${bacaan.dzikirShalat[pageIndex].terjemahan}';
    }
  }

  int _panjang(String input) {
    if (input == 'Pagi') {
      return Dzikir().dzikirPagi.length;
    } else if (input == 'Petang') {
      return Dzikir().dzikirPetang.length;
    } else {
      return Dzikir().dzikirShalat.length;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initCounter(widget.title);
    icon = Icons.close;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Text(
            'Dzikir ${widget.title} - ${pageIndex + 1}/${_panjang(widget.title)}'),
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
          Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          _switcherJudul(widget.title),
                          style: kJudulStyle,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          // decoration: BeveledRectangleBorder(
                          //     borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              _switcherAyat(widget.title),
                              style: kAyatStyle,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                        Container(
                          // shape: BeveledRectangleBorder(
                          //     borderRadius: BorderRadius.circular(5.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Text(
                              _switcherTerjemah(widget.title),
                              textAlign: TextAlign.justify,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // margin: EdgeInsets.only(top: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      pageIndex != 0
                          ? OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                surfaceTintColor: Color(0xffD0E1F9),
                                side: BorderSide(
                                    width: 2, color: Color(0xffD0E1F9)),
                                // fixedSize: Size(300, 65),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              onPressed: () {
                                if (pageIndex > 0) {
                                  setState(() {
                                    pageIndex--;
                                    _initCounter(widget.title);
                                    icon = Icons.close;
                                  });
                                }
                              },
                              child: Icon(Icons.arrow_left,
                                  color: Color(0xffD0E1F9))
                              // Text(
                              //   'Sebelumnya',
                              //   style: TextStyle(color: Color(0xffD0E1F9)),
                              // ),
                              )
                          : SizedBox(width: 50),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          surfaceTintColor: Color(0xffD0E1F9),
                          side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
                          // fixedSize: Size(300, 65),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.home, color: Color(0xffD0E1F9)),
                      ),
                      pageIndex != _panjang(widget.title) - 1
                          ? OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                surfaceTintColor: Color(0xffD0E1F9),
                                side: BorderSide(
                                    width: 2, color: Color(0xffD0E1F9)),
                                // fixedSize: Size(300, 65),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                              ),
                              // padding: EdgeInsets.all(8.0),
                              // color: Colors.green[500],
                              onPressed: () {
                                if (pageIndex < _panjang(widget.title) - 1) {
                                  setState(() {
                                    pageIndex++;
                                    _initCounter(widget.title);
                                    icon = Icons.close;
                                  });
                                }
                              },
                              child: Icon(Icons.arrow_right,
                                  color: Color(0xffD0E1F9))
                              // Text(
                              //   'Selanjutnya',
                              //   style: TextStyle(color: Color(0xffD0E1F9)),
                              // ),
                              )
                          : SizedBox(
                              width: 100,
                            )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () {
//          setState(() {
//            if (_counter > 1) {
//              _counter--;
//            } else {
//              _counter = 0;
//              icon = Icons.check;
//            }
//          });
//        },
//        label: Text(
//          '$_counter',
//          style: kCounter,
//        ),
//        icon: Icon(
//          icon,
//          size: 50,
//        ),
//        backgroundColor: Colors.tealAccent,
//      ),
    );
  }
}
