import 'package:flutter/material.dart';

import '../util/preference.dart';

class Settings extends StatefulWidget {
  final Function(String lang, double fontSize, bool showTranslation,
      bool showTransliteration) callbackTrigger;
  final Color themeColor;
  const Settings(
      {super.key, required this.callbackTrigger, required this.themeColor});

  @override
  State<Settings> createState() => _SettingsState();
}

enum LangOption { bahasa, english }

class _SettingsState extends State<Settings> {
  Function? translationLang;
  LangOption _langOption = LangOption.bahasa;
  bool showTranslation = true;
  bool showTransliteration = true;
  double fontSize = 23;

  @override
  void initState() {
    initContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: IconButton(
            onPressed: back,
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.white,
            )),
        backgroundColor: widget.themeColor,
      ),
      body: Stack(
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
          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                  top: 18.0,
                ),
                child: Text(
                  'Choose Translation Language',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Row(
                  children: [
                    const Text('Indonesia',
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                    const Spacer(),
                    Radio(
                        activeColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        value: LangOption.bahasa,
                        groupValue: _langOption,
                        onChanged: (LangOption? value) {
                          setState(() {
                            _langOption = value!;
                          });
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: Row(
                  children: [
                    const Text('English',
                        style: TextStyle(fontSize: 14, color: Colors.white)),
                    const Spacer(),
                    Radio(
                        value: LangOption.english,
                        activeColor: Colors.white,
                        hoverColor: Colors.white,
                        focusColor: Colors.white,
                        groupValue: _langOption,
                        onChanged: (LangOption? value) {
                          setState(() {
                            _langOption = value!;
                          });
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 8, top: 8),
                child: Row(
                  children: [
                    const Text('Show Translation',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    const Spacer(),
                    Switch(
                      activeColor: Colors.white,
                      value: showTranslation,
                      onChanged: toggleTranslation,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 6, top: 8),
                child: Row(
                  children: [
                    const Text('Show Transliteration',
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                    const Spacer(),
                    Switch(
                      activeColor: Colors.white,
                      value: showTransliteration,
                      onChanged: toggleTransliteration,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 6, top: 10),
                child: ListTile(
                  onTap: () {},
                  title: Row(
                    children: [
                      // Padding(

                      // ),
                      const Text('Arabic Font Size',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                      const Spacer(),
                      Text(
                        '${(fontSize).toInt()} pts',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  subtitle: Slider(
                    thumbColor: Colors.white,
                    activeColor: Colors.white,
                    label: fontSize.toString(),
                    max: 35,
                    min: 18,
                    value: fontSize,
                    onChanged: setFontSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void toggleTranslation(bool value) {
    setState(() {
      showTranslation = !showTranslation;
    });
  }

  void toggleTransliteration(bool value) {
    setState(() {
      showTransliteration = !showTransliteration;
    });
  }

  void setFontSize(double value) {
    setState(() {
      fontSize = value;
    });
  }

  Future<void> initContent() async {
    _langOption =
        LangOption.values.byName(await getLanguagePreferences() ?? 'bahasa');
    showTranslation = await getTranslationPreferences() ?? false;
    showTransliteration = await getTransliterationPreferences() ?? false;
    fontSize = await getFontSizePreferences() ?? 23;
    setState(() {});
  }

  void back() {
    widget.callbackTrigger(
        _langOption.name, fontSize, showTranslation, showTransliteration);
    Navigator.pop(context);
  }
}
