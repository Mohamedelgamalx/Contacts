import 'package:flutter/material.dart';
import 'contact.dart';
import 'contact_provider.dart';
import 'home.dart';

List<Contact> contactList = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ContactProvider.instance.open();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}