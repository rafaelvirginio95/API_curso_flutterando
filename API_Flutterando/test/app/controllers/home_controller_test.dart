// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/app/controllers/home_controller.dart';
import 'package:todo/app/models/todo_model.dart';
import 'package:todo/app/repositories/todo_repository.dart';

class RepoMock extends Mock implements ToDoRepository{}


void main(){
  TestWidgetsFlutterBinding.ensureInitialized();
  final repo = RepoMock();
  //final repo =  ToDoRepository();
  final controller = HomeController(repo);

  List<ToDoModel> future = [ToDoModel(id: 0, userId: 1, title: 'test', completed: false)];

  test('deve preencher todos', () async {
    when(await repo.fetchToDos()).thenReturn(future);
    await controller.start();
    expect(controller.todos.length, 200);
  });
}