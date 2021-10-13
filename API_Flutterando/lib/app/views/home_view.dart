import 'package:flutter/material.dart';
import 'package:todo/app/controllers/home_controller.dart';
import 'package:todo/app/enums/home_enum.dart';
import 'package:todo/app/models/todo_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final controller = HomeController();

  _success(){
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder:  (context, index){
        ToDoModel todo = controller.todos[index];
        return ListTile(
          leading: Checkbox(
            value: todo.completed,
            onChanged: (bool? value) { 
              setState((){todo.completed = value!;});
            },
          ),
          title: Text(todo.title),
          subtitle: Text('ID: ${todo.id}'),

        );
      }
    );
  }

  _error(){
    return Center(
      child: ElevatedButton(
        onPressed: (){
          controller.start();
        },
        child: const Text('Try again')
      )
    );
  }

  _loading(){
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(50),
        child: SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator()
        ),
      )
    );
  }

  _start(){
    return Container();
  }

  stateManagement(HomeState state){
    switch(state) {
      case HomeState.start:
        return _start();
      case HomeState.loading:
        return _loading();
      case HomeState.success:
        return _success();
      case HomeState.error:
        return _error();
      default:
        return _start();
    }
  }


  @override
  initState(){
    controller.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TO-DO'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: (){
              controller.start();
            }
          )
        ]
      ),
      body: ValueListenableBuilder(
        valueListenable: controller.state,
        builder: (context, HomeState state, child){
          return stateManagement(state);
        }
      ),
    );
  }
}