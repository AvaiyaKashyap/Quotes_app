import 'package:flutter/material.dart';
import 'package:quote_app/view/screen/quotesCategory.dart';
import 'package:quote_app/view/screen/quotesHomePage.dart';
import 'package:quote_app/view/screen/quotesPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const QuotesCategory(),
        'cat': (context) => const quotesPage(),
      },
    );
  }
}
