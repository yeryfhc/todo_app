
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/db_model.dart';
import 'package:todo_app/model/todo_model.dart';




 
  
final todoNoteProvider = ChangeNotifierProvider<TodoNoteNotifier>((ref) {
  return TodoNoteNotifier() ;
});






class TodoNoteNotifier extends ChangeNotifier {
     
      // Save Note
     saveNote(TodoModel newTodomodel) async{
     final db= await DBTodoApp.db.database;
     final res = db.insert('todonapp', newTodomodel.toMap());
     notifyListeners();
     return res;
  }
    bool boxchek=false;
     boxchecke(){
      switch (boxchek) {
        case true: boxchek=false;
        break;
        case false:boxchek=true;
          break;
        default:boxchek=false;
      }
    }
  // Get Note
    Future<List<TodoModel>> getNote() async{
    final db = await  DBTodoApp.db.database;
    final res= await db.query('todonapp');
    List<TodoModel> list =res.isNotEmpty? res.map((e) => TodoModel.fromMap(e)).toList():[];
    notifyListeners();
    return list;
  }
    //  Delete Note by ID
    deleteNoteID(int id) async{

      final db =  await DBTodoApp.db.database;
      final res = db.delete('todonapp',where: 'id+?',whereArgs: ['id']);
      notifyListeners();
      return res;
    }
    
    // Delete all Note 
    deleteAll()async{
     final db = await DBTodoApp.db.database;
     db.rawDelete('DELETE FROM todonapp');
     notifyListeners();
 

    }

  when({required Widget Function(dynamic data) data, required Center Function(dynamic error, dynamic stackTrace) error, required Center Function() loading}) {}

  
}