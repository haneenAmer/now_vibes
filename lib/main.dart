import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:now_vibes/backend/authenticator.dart';
import 'dart:developer' as devtools show log;

import 'package:now_vibes/state/providers/is_loggedin_proovider.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure that Flutter bindings are initialized.
  await Firebase.initializeApp(); // Initialize Firebase.
  runApp(const ProviderScope(child: MyApp()));
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
        home: Consumer(builder: (context, ref, child) {
          final isLoggedIn = ref.watch(isLoggedInProvider);

          if (isLoggedIn) {
            return const MainView();
          } else {
            return const LogginView();
          }
        }));
  }
}

// when you are already logged in
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('main view'),
        ),
        body: const LogginView(),
      ),
    );
  }
}

// when you are not logged in
class LogginView extends StatelessWidget {
  const LogginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('loggin view')),
      body: Column(children: [
        TextButton(
            onPressed: () async {
              final result = await const Authenticator().loginWithGoogle();
              result.log();
            },
            child: const Text('google')),
        TextButton(
            onPressed: () async {
              final result = await const Authenticator().loginWithFacebook();
              result.log();
            },
            child: const Text('facebook')),
      ]),
    );
  }
}
