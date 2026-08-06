import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double num = 0;
  double num2 = 0;
  double result = 0;
  String operador = '';
  bool _telaInvertida = false;

  late final AnimationController _rotController;

  @override
  void initState() {
    super.initState();
    _rotController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _rotController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      num++;
    });
  }

  void _decrementCounter() {
    setState(() {
      num--;
    });
  }

  void _incrementCounter2() {
    setState(() {
      num2++;
    });
  }

  void _decrementCounter2() {
    setState(() {
      num2--;
    });
  }

  double _calcularResultado(String operador) {
    switch (operador) {
      case "+":
        result = num + num2;
        break;
      case "-":
        result = num - num2;
        break;
      case "*":
        result = num * num2;
        break;
      case "/":
        if (num2 != 0){
          result = num / num2;
        }
      default:
        return 0;
    }
    return result;
  }

  void _girarTela() {
    _telaInvertida = !_telaInvertida;
    _rotController.animateTo(_telaInvertida ? 0.5 : 0);
  }

  void _limparTela() {
    num = 0;
    num2 = 0;
    result = 0;
    operador = '';
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('sinto muito amigo...'),
          content: const Text('VOCÊ É BETA!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Aceitar o destino...'),
            ),
          ],
        );
      },
    );
    Future.delayed(const Duration(milliseconds: 500), () {
      _girarTela();
    });
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotController,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              const Text('Quanto de aura você tem? (primeiro contador)'),
              Text('$num', style: Theme.of(context).textTheme.headlineMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.black, width: 1),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _incrementCounter();
                    },
                    child: Text('Farmar aura'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.black, width: 1),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (num > 0) {
                        _decrementCounter();
                      }
                    },
                    child: Text('Perder aura'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Selecione a operação pra calular a AURA!'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    onPressed: () {
                      setState(() {
                        operador = '+';
                      });
                    },
                    child: Text('+'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    onPressed: () {
                      setState(() {
                        operador = '-';
                      });
                    },
                    child: Text('-'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    onPressed: () {
                      setState(() {
                        operador = '*';
                      });
                    },
                    child: Text('*'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    onPressed: () {
                      setState(() {
                        operador = '/';
                      });
                    },
                    child: Text('/'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              const Text('Quanto de aura você tem TAMBÉM? (segundo contador)'),
              Text('$num2', style: Theme.of(context).textTheme.headlineMedium),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.black, width: 1),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _incrementCounter2();
                    },
                    child: Text('Farmar aura'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.black, width: 1),
                      textStyle: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (num2 > 0) {
                        _decrementCounter2();
                      }
                    },
                    child: Text('Perder aura'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Clique no botão para apresentar o resultado da AURA!'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black, width: 1),
                    ),
                    onPressed: () {
                      setState(() {
                        _calcularResultado(operador);
                      });
                    },
                    child: Text('='),
                  ),
                ],
              ),
              Text(
                '$result',
                style: TextStyle(fontSize: 55, color: Colors.green),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      side: BorderSide(color: Colors.black, width: 2),
                    ),
                    onPressed: () {
                      setState(() {
                        _limparTela();
                      });
                    },
                    child: Text(
                      'VIRAR BETA!',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}