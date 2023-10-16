import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'myapp.dart';
import 'myhome.dart';

const String site = 'https://dztvpwxvtwduzpymjgxp.supabase.co/rest/v1/users?select=%2A&email=eq.';
const String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6dHZwd3h2dHdkdXpweW1qZ3hwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQyNTg1MzgsImV4cCI6MjAwOTgzNDUzOH0.3GCGNxJWtET2ScYWzS5_hl1CcHL2fCZB-LwQUmJjORQ';

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

  void logIn () async
  {
    email = Uri.encodeComponent(email);
    String siteFull = site + email;

    Map<String, String> header = {};
    header["apikey"] =  apikey;

    var client = http.Client();

    final responde = await client.get(Uri.parse(siteFull), headers: header);
    var psw = (jsonDecode(responde.body))[0]['password'];

    if(responde.statusCode == 200 && psw == password){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyHome()),
      );
      return;
    }

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyApp()),
      );
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
