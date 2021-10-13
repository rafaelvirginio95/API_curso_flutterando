import 'dart:convert';

class ToDoModel {
  int userId;
  int id;
  String title;
  bool completed;

  ToDoModel({required this.userId, required this.id, required this.title, required this.completed});


  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      completed: map['completed'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) => ToDoModel.fromMap(json.decode(source));
}
