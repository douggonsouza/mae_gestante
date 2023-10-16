import 'package:flutter/material.dart';
import 'consulta.dart';

class Home extends StatefulWidget  {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
              children: <Widget> [
                Consulta(especialidade: 'Consulta: Obstetra  - 2023-11-15 13:30:00', nome: 'Robson Nascimento dos Santos'),
                Consulta(especialidade: 'Consulta: Dermatologista  - 2023-12-25 15:45:00', nome: 'Douglas G. de Souza, Dr.'),
              ] 
          )
        ),
      ),
    );
  }
}