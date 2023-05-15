import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:muslim_in/view/text_and_voice_field.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'chat_item.dart';
import '../read_data/chat_model.dart';
import '../read_data/chats_provider.dart';

class SlidingupPanel extends StatefulWidget {
  const SlidingupPanel({super.key});

  @override
  State<SlidingupPanel> createState() => _SlidingupPanelState();
}

class _SlidingupPanelState extends State<SlidingupPanel> {
  PanelController _panelController = PanelController();

  @override
  void initState() {
    super.initState();
  }

  void togglePanel() => _panelController.isPanelOpen
      ? _panelController.close()
      : _panelController.open();
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        maxHeight: 430,
        controller: _panelController,
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        collapsed: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Color(0xFF272A35),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: ClipOval(child: Image.asset("sources/gpt.jpg")),
              ),
              SizedBox(
                width: 10,
              ),

              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  surfaceTintColor: Color(0xffD0E1F9),
                  side: BorderSide(width: 2, color: Color(0xffD0E1F9)),
                  fixedSize: Size(270, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                ),
                onPressed: togglePanel,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Curhat disini...",
                      // textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xffD0E1F9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              )

              // GestureDetector(
              //   child: Container(
              //     // alignment: Alignment.center,
              //     // height: 70,
              //     child: Padding(
              //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              //       child: Row(
              //         children: [
              //           Container(
              //             height: 60,
              //             child: ClipOval(child: Image.asset("sources/gpt.jpg")
              //                 // Image.network(
              //                 //   'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
              //                 ),
              //           ),
              //           SizedBox(
              //             width: 15,
              //           ),
              //           Text(
              //             "CurhatGPT",
              //             style: TextStyle(
              //                 color: Colors.white,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 24),
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              //   onTap: togglePanel,
              // )

              //   ],
              // ),
            ],
          ),
          // GestureDetector(
          //   onTap: togglePanel,
          //   child: Center(
          //     child: Container(
          //       margin: EdgeInsets.only(top: 15),
          //       height: 10,
          //       width: 30,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: Colors.grey.shade300),
          //     ),
        ),
        panel: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
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
                Container(
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child:
                              ClipOval(child: Image.asset("sources/gpt.jpg")),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "CurhatGPT",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Consumer(builder: (context, ref, child) {
                    final chats = ref.watch(chatsProvider).reversed.toList();
                    chats.add(Message(
                      text: 'Halo! Mau curhat apa hari ini?',
                      date: DateTime.now().subtract(Duration(minutes: 1)),
                      isSentByMe: false,
                    ));
                    return ListView.builder(
                        reverse: true,
                        itemCount: chats.length,
                        itemBuilder: (context, index) => ChatItem(
                              text: chats[index].text,
                              isMe: chats[index].isSentByMe,
                            ));
                  }),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: TextAndVoiceField(),
                ),
              ],
            ),
          ],
        ));
  }
}
