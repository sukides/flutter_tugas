import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sayyid doyan ulik Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Beranda(),
    );
  }
}

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
            'Belajar Flutter',
            style: TextStyle(
                              fontSize: 24, 
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 99, 25, 25
                              ),),
          ),
        ),
      ),
      body: 
      const Center(
        child: Text(
          'Coba coba aja dulu yakan!',
          style: TextStyle(fontSize: 20,
          color: Color.fromARGB(255, 99, 25, 25),
          fontWeight: FontWeight.bold,
          ),
        ),
      ),

      bottomNavigationBar:
       Container(
        color: Colors.blue,
        height: 50,
        child: const Center(
          child: Text(
            'by sayyid abdul ganteng',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

