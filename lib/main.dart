import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main_page.dart';
import "sign_up.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final auth = FirebaseAuth.instanceFor(
      app: Firebase.app(), persistence: Persistence.NONE);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Bar Push';

    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
            primaryColor: Color.fromARGB(255, 51, 121, 54),
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: Color.fromARGB(255, 247, 246, 246),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))))),
        home: MyCustomForm());
  }
}
