import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:vibration/vibration.dart';

class Tasbih extends StatefulWidget {
  const Tasbih({super.key});

  @override
  State<Tasbih> createState() => _TasbihState();
}

class _TasbihState extends State<Tasbih> {
  int _count = 0;
  void _incrementCount() {
    setState(() {
      if (_count < pilihan!) {
        _count++;
      } else if (reset == true || _count == pilihan!) {
        Vibration.vibrate(duration: 1000, amplitude: 128);
        _count = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
            child: Text(
          "TASBIH",
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
          Column(
            children: [
              DropdownButtons(),
              Center(
                child: Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${_count}",
                          style: TextStyle(
                              color: Color(0xFFD0E1F9),
                              fontSize: 90,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Tap Anywhere!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    DottedBorder(
                      color: Colors.white,
                      strokeWidth: 3,
                      dashPattern: [8, 4],
                      child: Container(
                        height: 600.0,
                        width: 350.0,
                        decoration: BoxDecoration(border: Border.all()),
                        // color: Colors.black,
                        child: GestureDetector(
                          onTap: _incrementCount,
                        ),
                      ),
                    ),
                    // ElevatedButton(
                    //   child: Text('Vibrate for 1000ms'),
                    //   onPressed: () {
                    //     Vibration.vibrate(duration: 1000, amplitude: 128);
                    //   },
                    // ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DropdownButtons extends StatefulWidget {
  const DropdownButtons({super.key});

  @override
  State<DropdownButtons> createState() => _DropdownButtonState();
}

final List<String> jumlahDzikir = [
  '33x',
  '100x',
];
int? pilihan;
bool? reset;
String? selectedValue;

final _formKey = GlobalKey<FormState>();

class _DropdownButtonState extends State<DropdownButtons> {
  String dropdownValue = jumlahDzikir.toString();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      decoration: InputDecoration(
        fillColor: Color(0xffD0E1F9),
        //Add isDense true and zero Padding.
        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: const Text(
        'Jumlah Dzikir',
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
      selectedItemBuilder: (BuildContext context) {
        return jumlahDzikir.map<Widget>((String item) {
          // This is the widget that will be shown when you select an item.
          // Here custom text style, alignment and layout size can be applied
          // to selected item string.
          return Container(
            alignment: Alignment.centerLeft,
            constraints: const BoxConstraints(minWidth: 100),
            child: Text(
              item,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
            ),
          );
        }).toList();
      },
      items: jumlahDzikir
          .map(
            (item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 18,
                  // color: Colors.white,
                ),
              ),
            ),
          )
          .toList(),
      validator: (value) {
        if (value == null) {
          return 'Please select Jumlah Dzikir.';
        }
        return null;
      },
      onChanged: (value) {
        //Do something when changing the item if you want.
        // print(value.toString());
        if (value.toString() == '33x') {
          pilihan = 33;
          reset = true;
          print(pilihan);
        } else {
          pilihan = 100;
          reset = true;
          print(pilihan);
        }
      },
      onSaved: (value) {
        selectedValue = value.toString();
        print(value.toString());
      },
      buttonStyleData: const ButtonStyleData(
        height: 60,
        padding: EdgeInsets.only(left: 20, right: 10),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.white,
        ),
        iconSize: 40,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

// class CounterScreen extends StatefulWidget {
//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }

// class _CounterScreenState extends State<CounterScreen> {
//   @override
//   int _count = 0;

//   void _incrementCount() {
//     setState(() {
//       _count++;
//     });
//   }

//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             FloatingActionButton(
//               child: Icon(Icons.add),
//               onPressed: _incrementCount,
//             ),
//             Text("${_count}"),
//           ],
//         ),
//       ),
//     );
//   }
// }
