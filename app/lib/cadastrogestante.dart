import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:http/http.dart' as http;
import 'myhome.dart';

const String site = 'https://dztvpwxvtwduzpymjgxp.supabase.co/rest/v1/users';
const String apikey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6dHZwd3h2dHdkdXpweW1qZ3hwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQyNTg1MzgsImV4cCI6MjAwOTgzNDUzOH0.3GCGNxJWtET2ScYWzS5_hl1CcHL2fCZB-LwQUmJjORQ';

// Get a reference your Supabase client
final supabase = Supabase.instance.client;

class Cadastrogestante extends StatefulWidget  {
  const Cadastrogestante({super.key, required this.title});

  final String title;

  @override
  State<Cadastrogestante> createState() => _CadastrogestanteState();
}

class _CadastrogestanteState extends State<Cadastrogestante> {

  String name = '';
  String email = '';
  String password = '';

  void cadastrar () async
  {
    Map<String, String> dd = {
      'name': name,
      'email': email,
      'password': password,
    };

    Map<String, String> header = {};
    header["apikey"] =  apikey;

    var client = http.Client();
    final responde = await client.post(Uri.parse(site), headers: header, body: dd);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHome()),
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
                'Nome:'
              ),
              TextField(
                onChanged: (value) {
                  name = value;
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
                  cadastrar()
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
