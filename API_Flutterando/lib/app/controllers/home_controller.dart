import 'package:flutter/material.dart';
import 'package:todo/app/enums/home_enum.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/repositories/todo_repository.dart';

class HomeController{
  
  List<ToDoModel> todos = [];
  late ToDoRepository repo;

  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([ToDoRepository? repository]){
    repo = repository ?? ToDoRepository();
  }

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await repo.fetchToDos();
      state.value = HomeState.success;
    } on Exception catch (e) {
      state.value = HomeState.error;
    }
  }

}