// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/app/repositories/todo_repository.dart';

class DioMock extends Mock implements Dio{}


void main(){
  TestWidgetsFlutterBinding.ensureInitialized();
  final dio = DioMock();

  final repo =  ToDoRepository(dio);

  test('deve retornar uma lista de todos', () async {
    var data = json.decode(await rootBundle.loadString('assets/data/todos.json'));
    when(dio.get('')).thenAnswer((_) async => Response(data: data, statusCode:200, requestOptions: RequestOptions(path: '/')));
    var test = await repo.fetchToDos();
    expect(test[0].title, 'delectus aut autem');
  });
}