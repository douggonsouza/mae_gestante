import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'mylogin.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Supabase.initialize(
    url: 'https://dztvpwxvtwduzpymjgxp.supabase.co', 
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR6dHZwd3h2dHdkdXpweW1qZ3hwIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTQyNTg1MzgsImV4cCI6MjAwOTgzNDUzOH0.3GCGNxJWtET2ScYWzS5_hl1CcHL2fCZB-LwQUmJjORQ'
  );

  // Get a reference your Supabase client
  // final supabase = Supabase.instance.client;

  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: MyLogin(),
  ));
}

