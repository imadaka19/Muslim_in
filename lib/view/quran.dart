import 'package:flutter/material.dart';
import 'package:lamsz_quran_api/lamsz_quran_api.dart';

import 'quran_content.dart';

class Quran extends StatefulWidget {
  final Color? themeColor;
  final String? translationLang;
  const Quran({Key? key, this.themeColor, this.translationLang})
      : super(key: key);

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  List<SurahHeaderModel> surahList = [];
  List<SurahHeaderModel> searchList = [];
  bool isLoadingSurahList = false;
  TextEditingController searchController = TextEditingController();
  bool isSearchOn = false;
  late Color themeColor;
  late String translationLang;

  @override
  void initState() {
    getListOfSurah();
    themeColor = Color(0xFF272A35);
    translationLang = widget.translationLang ?? 'bahasa';

    super.initState();
  }

  getListOfSurah() async {
    isLoadingSurahList = true;
    surahList = await getSurahList();
    setState(() {
      searchList = surahList;
      isLoadingSurahList = false;
    });
  }

  filterText(String text) {
    return text
        .toLowerCase()
        .replaceAll(' ', '')
        .replaceAll('aa', 'a')
        .replaceAll("'", '')
        .replaceAll('uu', 'u')
        .replaceAll('jj', 'j')
        .replaceAll('to', 'tha')
        .replaceAll('tho', 'tha')
        .replaceAll('asy', 'as')
        .replaceAll('sh', 's')
        .replaceAll('thi', 'ti')
        .replaceAll('ii', 'i')
        .replaceAll('ff', 'f')
        .replaceAll('gho', 'gha')
        .replaceAll('gh', 'g')
        .replaceAll('kh', 'h')
        .replaceAll('ts', 's')
        .replaceAll('dz', 'z')
        .replaceAll('thu', 'tu')
        .replaceAll('gho', 'gha')
        .replaceAll('go', 'gha')
        .replaceAll('qq', 'q')
        .replaceAll('dd', 'd')
        .replaceAll('dh', 'd');
  }

  searchSurahName(String text) {
    isLoadingSurahList = true;
    searchList = surahList
        .where((element) =>
            filterText(element.nameLatin!).contains(filterText(text)))
        .toList();
    setState(() {
      searchList = searchList;
      isLoadingSurahList = false;
    });
  }

  resetList() {
    setState(() {
      searchList = surahList;
      searchController.text = '';
    });
  }

  turnOnSearch() {
    setState(() {
      isSearchOn == false ? isSearchOn = true : isSearchOn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Surah'),
          backgroundColor: Color(0xFF272A35),
        ),
        body: isLoadingSurahList
            ? const CircularProgressIndicator(
                backgroundColor: Color(0xFF272A35),
              )
            : Stack(
                // backgroundColor: Color(0xFF272A35),
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
                      isSearchOn
                          ? Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: TextField(
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                      cursorColor: Colors.white,
                                      controller: searchController,
                                      onSubmitted: (val) {
                                        searchSurahName(val);
                                      },
                                      decoration: const InputDecoration(
                                          iconColor: Colors.white,
                                          focusColor: Colors.white,
                                          hoverColor: Colors.white,
                                          prefixIconColor: Colors.white,
                                          suffixIconColor: Colors.white,
                                          fillColor: Colors.white,
                                          hintText: 'type surah name here',
                                          hintStyle:
                                              TextStyle(color: Colors.white),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5)),
                                              borderSide: BorderSide(
                                                  color: Colors.white,
                                                  style: BorderStyle.solid,
                                                  width: 0.5))),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: IconButton(
                                      onPressed: () {
                                        resetList();
                                      },
                                      color: Colors.white,
                                      icon: const Icon(Icons.restore)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: IconButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        turnOnSearch();
                                      },
                                      icon: const Icon(Icons.cancel)),
                                )
                              ],
                            )
                          : Row(children: [
                              const Spacer(),
                              IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    turnOnSearch();
                                  },
                                  icon: const Icon(Icons.search)),
                            ]),
                      Expanded(
                          child: ListView.builder(
                              itemCount: searchList.length,
                              itemBuilder: (context, i) {
                                return listSurah(i, context);
                              })),
                    ],
                  ),
                ],
              ));
  }

  Padding listSurah(int i, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
          color: (i % 2 == 1)
              ? themeColor.withOpacity(0.5)
              : themeColor.withOpacity(0.3),
          child: Center(
            child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QuranContent(
                                surahList: searchList,
                                indexSurah: i,
                                surahNumber: searchList[i].id!,
                                surahArabicName: searchList[i].nameArabic!,
                                surahTranslationName: searchList[i].nameLatin!,
                                themeColor: themeColor,
                                translationLang: translationLang,
                              )));
                },
                leading: Text(
                  (searchList[i].id).toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                title: Text(searchList[i].nameLatin!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    )),
                subtitle:
                    Text('${searchList[i].type!} || ${searchList[i].ayah} ayah',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                trailing: Text(
                  searchList[i].nameArabic!,
                  style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                )),
          )),
    );
  }
}
