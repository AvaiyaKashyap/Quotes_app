import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quote_app/modal/history_modal.dart';
import 'package:sqflite/sqflite.dart';

import '../../controller/helper/QuotesGlobal.dart';
import '../../controller/helper/database_handler.dart';
import '../../controller/helper/history_repo.dart';
class quotesPage extends StatefulWidget {
  const quotesPage({Key? key}) : super(key: key);

  @override
  State<quotesPage> createState() => _quotesPageState();
}

class _quotesPageState extends State<quotesPage> {


  late String currentQuote;
  late Timer timer;
  int quoteIndex = 0;
  Database? _database;

  @override
  void initState() {
    super.initState();
    currentQuote = Global.allquotes[quoteIndex];
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => changeQuote());
  }

  void changeQuote() {
    setState(() {
      quoteIndex = (quoteIndex + 1) % Global.allquotes.length;
      currentQuote = Global.allquotes[quoteIndex];
      Global.historylist.add(currentQuote);
      print("**************************");
      print("${Global.historylist}");
      print("**************************");
      insertDB();
      getFromHistory();
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
          currentQuote,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
  Future<Database?> openDB() async {
    _database = await DataBaseHandler().openDB();
    return _database;
  }

Future<void> insertDB() async {
  _database = await openDB();

  HistoryRepo historyRepo = new HistoryRepo();
  historyRepo.createTable(_database);

  HistoryModal   historyModal = new HistoryModal(currentQuote);

  await _database?.insert('History', historyModal.toMap());

  await _database?.close();
}
  Future<void> getFromHistory() async {
    _database = await openDB();

    HistoryRepo historyRepo = new HistoryRepo();
    await historyRepo.getHistory(_database);
    await _database?.close();
  }
}