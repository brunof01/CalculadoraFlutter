import 'package:aula01/screens/myhomepage.dart';
import 'package:aula01/screens/segunda_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de farmar aura',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Calculadora pra farmar aura'),
      //home: SegundaPage(),
    );
  }
}

