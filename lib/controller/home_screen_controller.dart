import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_sample_task/model/student_model.dart';

class HomeScreenController {
  static late Database database;
  static List<Map<String, Object?>> data = [];
  static List<StudentModel> studentsListData = [];

  static Future<void> initDb() async {
    // open database
    database = await openDatabase("sample.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, phNo INTEGER)');
    });
  }

// function to add new data to db
  static Future<void> addData() async {
    await database.rawInsert('INSERT INTO Test(name, phNo) VALUES(?, ?)', [
      'ddc',
      1255655678,
    ]);
  }

// to get data from db
  static Future<void> getData() async {
    data = await database.rawQuery('SELECT * FROM Test');
    studentsListData = data
        .map((e) => StudentModel(
            id: int.parse(e["id"].toString()),
            name: e["name"].toString(),
            phNo: int.parse(e["phNo"].toString())))
        .toList();

    log(data.toString());
  }

  static Future<void> deleteData(var id) async {
    await database.rawDelete('DELETE FROM Test WHERE id= ?', [id]);
    await getData();
  }

  static Future<void> updateDate(var id) async {
    await database.rawUpdate('UPDATE Test SET name = ?, phNo = ? WHERE id = ?',
        ['Thejal Santhosh', '09976654', id]);
    await getData();
  }
}
