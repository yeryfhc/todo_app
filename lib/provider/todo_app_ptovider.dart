

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/db_model.dart';
import 'package:todo_app/data/td_shareprefernce.dart';
import 'package:todo_app/model/todo_model.dart';




 
  
final todoNoteProvider = ChangeNotifierProvider<TodoNoteNotifier>((ref) {
  
  return TodoNoteNotifier() ;
  
});

// 'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');




class TodoNoteNotifier extends ChangeNotifier {

        // Save Note
     saveNoteInTrash(int id) async{
     final db= await DBTodoApp.db.database;
     final res = db.rawInsert('Insert into todoApptrash select id, title,note from todoApp');
     
    //  rawQuery('Insert into todoApptrash select id, title,note from todoApp');
     notifyListeners();
     return res;
  }


     
      // Save Note
     saveNote(TodoModel newTodomodel) async{
     final db= await DBTodoApp.db.database;
     final res = db.insert('todoApp', newTodomodel.toMap());
     notifyListeners();
     return res;
  }
    bool boxchek=false;
     boxchecke(){
      
      if (TodoSharePreference.readytd==false) {
        TodoSharePreference.readytd=true;
      }else{TodoSharePreference.readytd=false;}
      notifyListeners();
    }
  // Get Note
    Future<List<TodoModel>> getNote() async{
    final db = await  DBTodoApp.db.database;
    final res= await db.query('todoApp');
    List<TodoModel> list =res.isNotEmpty? res.map((e) => TodoModel.fromMap(e)).toList():[];
    
    return list;
  }
  // Get Trash
    Future<List<TodoModel>> getNoteTrash() async{
    final db = await  DBTodoApp.db.database;
    final res= await db.query('todoAppTrash');
    List<TodoModel> list =res.isNotEmpty? res.map((e) => TodoModel.fromMap(e)).toList():[];
    
    return list;
  }




    //  Delete Note by ID
    deleteNoteID(int id) async{

      final db =  await DBTodoApp.db.database;
      final res = db.delete('todoApp',where: 'id=?',whereArgs: [id]);
      notifyListeners();
      return res;
      
    }
    //  Delete Note by ID
    deleteNoteIDTRash(int id) async{

      final db =  await DBTodoApp.db.database;
      final res = db.delete('todoAppTrash',where: 'id=?',whereArgs: [id]);
      notifyListeners();
      return res;
      
    }
    
    // Delete all Note 
    deleteAll()async{
     final db = await DBTodoApp.db.database;
     db.rawDelete('DELETE FROM todoApp');
     notifyListeners();
 

    }

  when({required Widget Function(dynamic data) data, required Center Function(dynamic error, dynamic stackTrace) error, required Center Function() loading}) {}

  
}