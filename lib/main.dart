import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:now_vibes/screens/home_sceen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter bindings are initialized.
  await Firebase.initializeApp(); // Initialize Firebase.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          indicatorColor: Colors.pink,
          primarySwatch: Colors.grey),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
