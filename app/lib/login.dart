import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'myhome.dart';

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class Login extends StatefulWidget  {
  const Login({super.key, required this.title});

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email = '';
  String password = '';

  void logIn ()
  {
    final _future = supabase.from('users')
      .select<List<Map<String, dynamic>>>('*')
      .eq('email', 'douggonsouza@gmail.com');

    if(_future != null){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHome()),
      );
    }
    
  }

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
                  logIn()
                },
                child: const Text('Entrar')
              ),
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}