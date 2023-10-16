import 'package:flutter/material.dart';
import 'mylogin.dart';

class Cadastrogestante extends StatefulWidget  {
  const Cadastrogestante({super.key, required this.title});

  final String title;

  @override
  State<Cadastrogestante> createState() => _CadastrogestanteState();
}

class _CadastrogestanteState extends State<Cadastrogestante> {

  String nome = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Nome:'
              ),
              TextField(
                onChanged: (value) {
                  nome = value;
                },
                autofocus: true,
                keyboardType: TextInputType.text, 
              ),
              const Text(
                'E-Mail:'
              ),
              TextField(
                onChanged: (value) {
                  email = value;
                },
                autofocus: true,
                keyboardType: TextInputType.emailAddress, 
              ),
              const Text(
                'Senha'
              ),
              TextField(
                onChanged: (value) {
                  password = value;
                },
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              TextButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyLogin()),
                  )
                },
                child: const Text('Cadastrar')
              ),
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}