import 'package:flutter/material.dart';

void main()
  {
    runApp(MyApp());
  }

class MyApp extends StatelessWidget 
  {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return MaterialApp
      (
        title : 'belajar flutter',
        theme : ThemeData
        (
          primarySwatch: Colors.blue,
        ),
        home : const MyHomePage(title: 'belajar flutter'),
      );
    }
  }

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

