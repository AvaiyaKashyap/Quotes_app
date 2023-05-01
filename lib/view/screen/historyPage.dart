import 'package:flutter/material.dart';

import '../../controller/helper/QuotesGlobal.dart';
import '../../controller/helper/db_helper.dart';
class historyPage extends StatefulWidget {
  const historyPage({Key? key}) : super(key: key);

  @override
  State<historyPage> createState() => _historyPageState();
}

class _historyPageState extends State<historyPage> {
  Future<void> _addData() async {
    await SQLHelper.createData(Global.currentQuote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Global.allData.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text("${Global.allData[index]['quote']}"),
          ),
        ),
      ),
    );
  }
}
