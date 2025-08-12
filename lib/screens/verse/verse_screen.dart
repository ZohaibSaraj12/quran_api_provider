import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_api_provider/providers/translation_provider/translation_provider.dart';
import 'package:quran_api_provider/providers/verse%20provider/verse_provider.dart';


class VerseScreen extends StatelessWidget {
  final int surahNumber;
  const VerseScreen({super.key, required this.surahNumber});

  @override
  Widget build(BuildContext context) {
    final verseProvider = context.watch<VerseProvider>();
    final translationProvider = context.watch<TranslationProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Verse View", style: TextStyle(
          color: Colors.white,
          fontFamily: "SFPROBOLD",
          fontWeight: FontWeight.w600,
          fontSize: 25.0,
        ),),

      ),
      body: RepaintBoundary(
        child: Builder(builder: (context) {
          if (verseProvider.isLoading || translationProvider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (verseProvider.error != null) {
            return Center(child: Text("Couldn't find data Error ${verseProvider.error}"),);
          }
          if (verseProvider.ayahs.isEmpty || translationProvider.translation.isEmpty) {
            return Center(child: Text("No data Found"),);
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Scrollbar(
              interactive: true,
              radius: Radius.circular(10.0),
              thickness: 7.0,
              thumbVisibility: true,
              child: SingleChildScrollView(
               physics: ClampingScrollPhysics(),
                child: Center(
                  child: Card(
                    color: Colors.white,
                    shadowColor: Colors.black,

                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.green,
                        width: 3
                      ),
                      borderRadius: BorderRadius.circular(10.0),
        
                    ),
                   margin: EdgeInsets.all(20.0),
                    elevation: 10,
        
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                      child: Column(
        
                        children: verseProvider.ayahs.asMap().entries.map((entry) {
                          final index = entry.key;
                          final verse = entry.value;

                          final translationText = translationProvider.translation.length > index
                              ? translationProvider.translation[index].text
                              : "";
                          return Column(

                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  children: [
                                    Expanded(child: Divider()),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(verse.numberInSurah.toString(), style: TextStyle(
                                        fontFamily: "SFPROBOLD",
                                        fontSize: 20,
                                        color: Colors.teal
                                    ),),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(child: Divider()),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:40.0),
                                child: index == 0 ? surahNumber > 1 ? Text("${verse.text.substring(39)}\n",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,

                                  style: TextStyle(
                                      fontFamily: "Arabic", fontSize: 30,


                                  ),) : Text("${verse.text}\n",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,

                                  style: TextStyle(
                                      fontFamily: "Arabic", fontSize: 32,


                                  ),) : Text("${verse.text}\n",
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.center,

                                  style: TextStyle(
                                      fontFamily: "Arabic", fontSize: 30,


                                  ),),
                              ),
                              Text("Translation", style: TextStyle(
                                fontSize: 25,
                                fontFamily: "SFPROBOLD",
                                fontWeight: FontWeight.w600,
                                color: Colors.teal,
                              ),),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Divider(),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.0, bottom: 60, left: 20, right: 20.0),
                                  child: Text(
                                      translationText,
                                    style: TextStyle(
                                      fontFamily: "SFPROBOLD",
                                      fontSize: 15
                                    ),
                                  ))
                            ],
                          );
                        }).toList(),

                      ),
                    )
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
