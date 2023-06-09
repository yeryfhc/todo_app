// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/todo_model.dart';

class DBTodoApp {
  static Database? _database;
  static final DBTodoApp  db=DBTodoApp._();
  DBTodoApp._();
  Future<Database>get database async{
    if (_database!=null) return _database!;
    _database=await initDB();
    return _database!;
  }
  
  initDB() async {
   var  documentDirectory = await getDatabasesPath();
   String  path = join(documentDirectory,'AppTodo.db');
   return  await openDatabase(path,version: 1,onOpen: (db) {  
   },onCreate: (db, version) async{
     await db.execute(
        "CREATE TABLE todoapp("
        " id INTEGER PRIMARY KEY,"
         "title TEXT,"
         " note  TEXT, "
         ")"
     );
   },);

  }
  
      // Save note
     saveNote(TodoModel newTodomodel) async{
     final db= await DBTodoApp.db.database;
     final res = db.insert('todoapp', newTodomodel.toMap());
     return res;
  }
  
      // Get Note
    Future<List<TodoModel>> getNote() async{
    final db = await  DBTodoApp.db.database;
    final res= await db.query('todoapp');
    List<TodoModel> list =res.isNotEmpty? res.map((e) => TodoModel.fromMap(e)).toList():[];
    return list;
  }
    //  Delete Note by ID
    deleteNoteID(int id) async{

      final db =  await DBTodoApp.db.database;
      final res = db.delete('todoapp',where: 'id+?',whereArgs: ['id']);
      return res;
    }
    
    // Delete all Note 
    deleteAll()async{
     final db = await DBTodoApp.db.database;
     db.rawDelete('DELETE FROM todoapp');
 

    }

}