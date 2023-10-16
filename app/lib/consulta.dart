import 'package:flutter/material.dart';

class Consulta extends StatelessWidget {
  final String especialidade;
  final String nome;

  const Consulta(
      {super.key, required this.especialidade, required this.nome});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        child: Column(
          children: [
            Row( 
              children: <Widget> [
                Text(especialidade), 
              ] 
            ),
            Row( 
            children: <Widget> [
              Text(nome)
            ] 
          ),
        ]
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}