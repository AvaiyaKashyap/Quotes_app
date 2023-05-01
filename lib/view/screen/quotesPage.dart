import 'dart:async';

import 'package:flutter/material.dart';

import 'package:sqflite/sqflite.dart';

import '../../controller/helper/QuotesGlobal.dart';
import '../../controller/helper/db_helper.dart';


class quotesPage extends StatefulWidget {
  const quotesPage({Key? key}) : super(key: key);

  @override
  State<quotesPage> createState() => _quotesPageState();
}

class _quotesPageState extends State<quotesPage> {



  late Timer timer;
  int quoteIndex = 0;


  bool _isLoading = true;

  void _refreshData() async {
    final data = await SQLHelper.getAllData();
    setState(() {
      Global.allData = data;
      _isLoading = false;
    });
  }

  Future<void> _addData() async {
    await SQLHelper.createData(Global.currentQuote);
  }

  @override
  void initState() {
    super.initState();
    Global.currentQuote = Global.allquotes[quoteIndex];
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => changeQuote());
    _refreshData();
    _addData();
  }
  void adData(int? id) async {
    if(id != null)
    {
      final existingData = Global.allData.firstWhere((element) => element['id']==id);
      Global.currentQuote = existingData['quote'];
    }
  }
  void changeQuote() {
    setState(() {
      quoteIndex = (quoteIndex + 1) % Global.allquotes.length;
      Global.currentQuote = Global.allquotes[quoteIndex];
      Global.historylist.add(Global.currentQuote);
      print("**************************");
      print("${Global.historylist}");
      print("**************************");
    });
  }
  @override

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
        child: Text(
          Global.currentQuote,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }



}