import 'package:flutter/material.dart';
import 'package:studentapp/db/model/studentmodel.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentlistnotifier=ValueNotifier([]);

   late Database _db;

    Future<void>initializeddatabase()async{
    _db=await  openDatabase('studentdb',version: 1,onCreate:((Database db, int version){
    db.execute('CREATE TABLE student(id INTEGER PRIMARY KEY,name TEXT,place TEXT,age TEXT,phone TEXT,image TEXT)');
  }) );
    

} 
 
  Future<void>getAllStudents()async{
      final values=await _db.rawQuery('SELECT * FROM student');
    
      studentlistnotifier.value.clear();
      for (var map in values) {
       final oneStudent= StudentModel.fromMap(map);
       studentlistnotifier.value.add(oneStudent);
       
      }
      studentlistnotifier.notifyListeners();
  }

  Future<void>addStudent(StudentModel  value)async{
    studentlistnotifier.value.add(value);
    await  _db.rawInsert('INSERT INTO student(id, name,place,age,phone,image)VALUES(?,?,?,?,?,?)',[  value.id, value.name,value.place,value.age,value.phone,value.image]);
    getAllStudents();

  }

  Future<void>deleteStudent( int id)async{
    await _db.delete('student',where: 'id=?',whereArgs: [id]);
    getAllStudents();
  }

 Future<void>editStudent(int id, String name ,String place,String age,String phone,String image)async{
  final data={
     'image':image,
    'name': name,
    'place':place,
    'age': age,
    'phone':phone
  };
   await _db.update('student', data,where: 'id=?',whereArgs: [id]);
   getAllStudents();
   
 }