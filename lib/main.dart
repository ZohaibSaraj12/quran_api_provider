import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_api_provider/providers/surah%20provider/surah_provider.dart';
import 'package:quran_api_provider/providers/verse%20provider/verse_provider.dart';
import 'package:quran_api_provider/screens/home/surah_screen.dart';
import 'package:quran_api_provider/widgets/custom%20scroll/custom_scroll_widget.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SurahProvider()),
    ],
        child: MaterialApp(
          scrollBehavior: CustomScrollWidget(),
          debugShowCheckedModeBanner: false,
          home: SurahScreen(),
        )
    );
  }
}
