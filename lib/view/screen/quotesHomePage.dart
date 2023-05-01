import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quote_app/controller/helper/database_handler.dart';
import 'package:quote_app/controller/helper/history_repo.dart';
import 'package:sqflite/sqflite.dart';
import '../../controller/helper/quotesApiHelper.dart';
import '../../modal/quotesModal.dart';
import '../../controller/helper/QuotesGlobal.dart';

class QuotesHomePage extends StatefulWidget {
  const QuotesHomePage({Key? key}) : super(key: key);

  @override
  State<QuotesHomePage> createState() => _QuotesHomePageState();
}
class _QuotesHomePageState extends State<QuotesHomePage> {
  int starter = 10;
  Timer? timer;
  var dt = DateTime.now();

  void quotesRefresh(){
    setState((){
      print(Global.getQuote);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(Duration(seconds: 10), (Timer t) => quotesRefresh());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: QuotesApiHelper.quotesApiHelper.fetchData(),
          builder: (context, snp) {
            if (snp.hasError) {
              print("${snp.error}");
              return Center(
                child: Text("ERROR:- ${snp.error}"),
              );
            } else if (snp.hasData) {
              List<Quotes>? data = snp.data;
              return (data != null)
                  ? ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, i) {
                        return Container(
                          height: 700,
                           decoration: BoxDecoration(
                             gradient: LinearGradient
                               (
                                 begin: Alignment.center,
                                 end: Alignment.bottomCenter,
                                 colors: [
                               Colors.black26,
                               Colors.black87,
                             ])
                           ),
                           alignment: Alignment.center,
                            child: Container(
                              margin: EdgeInsets.all(25),
                              child: Text('"${data[i].quote = Global.getQuote}"',style: TextStyle(
                                color: Colors.white,
                                    fontSize: 30
                              ),),
                            ));
                      })
                  : const Center(
                      child: Text("NO DATA"),
                    );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

}
