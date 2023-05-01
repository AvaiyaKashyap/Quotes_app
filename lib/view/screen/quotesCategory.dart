import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quote_app/view/screen/historyPage.dart';
import 'package:quote_app/view/screen/quotesHomePage.dart';
import 'package:quote_app/view/screen/quotesPage.dart';

import '../../controller/helper/QuotesGlobal.dart';

class QuotesCategory extends StatefulWidget {
  const QuotesCategory({Key? key}) : super(key: key);

  @override
  State<QuotesCategory> createState() => _QuotesCategoryState();
}

class _QuotesCategoryState extends State<QuotesCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
        centerTitle: true,
        backgroundColor: Colors.black54,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> historyPage() ));
          }, icon: Icon(Icons.history)),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () {
                setState(() {
                  Global.allquotes = Global.happyquotes;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => quotesPage()));
                });
              }, child: Text("happy")),
              ElevatedButton(onPressed: () {
                setState(() {
                  Global.allquotes = Global.sadquotes;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => quotesPage()));
                });
              }, child: Text("sad")),
              ElevatedButton(onPressed: () {
                setState(() {
                  Global.allquotes = Global.angryquotes;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => quotesPage()));
                });
              }, child: Text("angry")),
              ElevatedButton(onPressed: () {
                setState(() {
                  Global.allquotes = Global.anxiousquotes;
                  Navigator.push(context, MaterialPageRoute(builder: (context) => quotesPage()));
                });
              }, child: Text("anxious")),
            ],
          ),
        ],
      )
      );
      // body: ListView.builder(
      //   padding: EdgeInsets.all(10),
      //   itemCount: Global.category.length,
      //   itemBuilder: (BuildContext context, int index){
      //     return Container();
      //   },
      // ),
  }

}


