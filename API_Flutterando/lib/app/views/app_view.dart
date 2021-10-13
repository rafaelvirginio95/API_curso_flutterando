import 'package:flutter/material.dart';

import 'package:todo/app/views/home_view.dart';

class AppView extends StatelessWidget {
  const AppView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Colors.blue)
      ),
      home: const HomeView(),
    );
  }
}