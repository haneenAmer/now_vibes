import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:now_vibes/backend/authenticator.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

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
      home: SafeArea(
        child: Scaffold(
          body: Column(children: [
            TextButton(
                onPressed: () async {
                  final result = await Authenticator().loginWithGoogle();
                  result.log();
                },
                child: const Text('google')),
            TextButton(
                onPressed: () async {
                  final result = await Authenticator().loginWithFacebook();
                  result.log();
                },
                child: const Text('facebook')),
          ]),
        ),
      ),
    );
  }
}
