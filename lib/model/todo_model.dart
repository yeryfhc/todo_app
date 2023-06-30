
import 'dart:convert';

TodoModel todoModelFromMap(String str)=>TodoModel.fromMap(json.decode(str));
String todoModeToMap(TodoModel data)=> jsonEncode(data.toMap());


class TodoModel {
  TodoModel({
       this.id,
       this.title,
       this.note,
       
  });
    int ? id;
    String ? title;
    String ? note;
 

factory TodoModel.fromMap(Map<String,dynamic>json)=>TodoModel(
 id:json["id"],
 title: json["title"],
 note:json["note"],
 );


Map<String,dynamic>toMap()=>{
 "id":id,
 "title":title,
 "note":note,
 

};




}


   


