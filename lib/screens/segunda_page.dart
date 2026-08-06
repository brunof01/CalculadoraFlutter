import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SegundaPage extends StatefulWidget {
  @override
  State<SegundaPage> createState() => _SegundaPageState();
}

class _SegundaPageState extends State<SegundaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("segunda tela"),
      ),
      body: Center(child: Column(children: [Text("tela 2 deu boa")])),
    );
  }
}
