// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



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
   String  path = join(documentDirectory,'AppTodoNote.db');
   return  await openDatabase(path,version: 1,onOpen: (db) {  
   },onCreate: (db, version) async{
     await db.execute(
        "CREATE TABLE todonapp("
        " id INTEGER PRIMARY KEY,"
         "title TEXT,"
         " note  TEXT"
         " priority int "
         ")"
         
     );
   });

  }
  
   
}