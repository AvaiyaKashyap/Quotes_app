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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Choose Your Mood"),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Global.allquotes = Global.happyquotes;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => quotesPage()));
                  });
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white,width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Text("Happy",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Global.allquotes = Global.sadquotes;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => quotesPage()));
                  });
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white,width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Text("Sad",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Global.allquotes = Global.angryquotes;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => quotesPage()));
                  });
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white,width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Text("angry",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    Global.allquotes = Global.anxiousquotes;
                    Navigator.push(context, MaterialPageRoute(builder: (context) => quotesPage()));
                  });
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white,width: 2),
                  ),
                  alignment: Alignment.center,
                  child: Text("anxious",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),),
                ),
              ),
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


