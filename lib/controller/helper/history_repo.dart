import 'package:sqflite/sqflite.dart';

class HistoryRepo{

  void createTable(Database? db){
    db?.execute('CREATE TABLE USER(id INTEGER PRIMARY KEY, svquote TEXT)');
  }

  Future<void> getHistory(Database? db) async{
    final List<Map<String, dynamic>> maps = await db!.query('History');

    print(maps);
  }
}