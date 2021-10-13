import 'package:dio/dio.dart';
import 'package:todo/app/models/todo_model.dart';

class ToDoRepository{
  
  late Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  ToDoRepository([Dio? client]){
    dio = client ?? Dio();
  }

  Future<List<ToDoModel>> fetchToDos() async {
    final response = await dio.get(url);
    final List<ToDoModel> todos = [];
    if(response.statusCode==200){
      response.data.forEach((value)=>todos.add(ToDoModel.fromMap(value)));
    }
    return todos;
  }


}