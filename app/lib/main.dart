import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'mylogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dztvpwxvtwduzpymjgxp.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6dHZwd3h2dHdkdXpweW1qZ3hwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQyNTg1MzgsImV4cCI6MjAwOTgzNDUzOH0.3GCGNxJWtET2ScYWzS5_hl1CcHL2fCZB-LwQUmJjORQ'
  );

  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyLogin(),
  ));
}

