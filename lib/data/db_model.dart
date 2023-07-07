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
   String  path = join(documentDirectory,'AppTasKDo4.db');
   return  await openDatabase(path,version: 1,onOpen: (db) {  
   },onCreate: (db, version) async{
     await db.execute(
        "CREATE TABLE todoApp("
        " id INTEGER PRIMARY KEY AUTOINCREMENT,"
         "title TEXT,"
         " note  TEXT"
         
         ")"
         
     );  await db.execute(
        "CREATE TABLE todoAppTrash("
        " id INTEGER ,"
         "title TEXT,"
         " note  TEXT"
         
         ")"
         
     );
   });

  }
  







   
}