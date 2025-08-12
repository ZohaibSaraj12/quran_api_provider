import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_api_provider/providers/surah%20provider/surah_provider.dart';
import 'package:quran_api_provider/providers/translation_provider/translation_provider.dart';
import 'package:quran_api_provider/providers/verse%20provider/verse_provider.dart';
import 'package:quran_api_provider/screens/verse/verse_screen.dart';

class SurahScreen extends StatelessWidget {

  const SurahScreen({super.key});

  @override
  Widget build(BuildContext context) {




    final surahProvider = context.watch<SurahProvider>();
    print("rebuild1");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("My Quran App", style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,

        )),
      ),
      body: RefreshIndicator(

        onRefresh: () {
           return context.read<SurahProvider>().getData();

        },
        child: Builder(

          builder: (context) {
            print("Rebuild 2");
            if (surahProvider.isLoading) {

              return Center(child: CircularProgressIndicator());
            }
            if (surahProvider.error != null) {
              return Text(" Error ${surahProvider.error}");
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                interactive: true,
               radius: Radius.circular(10.0),

                thumbVisibility: true,
                child: ListView.builder(
                    itemCount: surahProvider.surahs.length,
                    itemBuilder: (context, index) {
                      final surah = surahProvider.surahs;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        child: Card(
                          
                          color: Colors.white,
                          elevation: 10,

                          shadowColor: Colors.black,
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => MultiProvider(providers: [
                                ChangeNotifierProvider(create: (_) => VerseProvider(index + 1),

                                ),
                                ChangeNotifierProvider(create: (_) => TranslationProvider(index + 1))
                              ],
                                child: VerseScreen(surahNumber: (index + 1)),)
                              )
                              );
                            },
                            child: ListTile(

                              leading: Text((index + 1).toString(), style: TextStyle(
                                fontSize: 20,
                                fontFamily: "SFPROREGULAR",
                                fontWeight: FontWeight.bold,
                                color: Colors.teal
                              ),),
                              title: Text(surah[index].surahName, style: TextStyle(
                                fontFamily: "SFPROBOLD",
                                fontWeight: FontWeight.bold

                              ),),
                              subtitle: Text("${surah[index].revelationPlace}n - Verses: ${surah[index].totalAyah}"),
                              trailing: Text(surah[index].surahNameArabic, style: TextStyle(
                               fontSize: 20,
                                fontFamily: "Arabic",
                                fontWeight: FontWeight.w600,
                                color: Colors.black

                              ),),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            );

              },

            ),
      ),


    );
  }
}
