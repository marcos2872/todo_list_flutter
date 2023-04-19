import 'package:flutter/material.dart';
import 'package:todo_list/app/views/form_view.dart';
import 'package:todo_list/app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/' :(context) => const HomeView(),
        '/form' :(context) => const FormView()
      },
    );
  }
}
