import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "sign_up.dart";
import 'package:location/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final auth = FirebaseAuth.instanceFor(
      app: Firebase.app(), persistence: Persistence.NONE);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Bar Push';
    String location = Location().getLocation().toString();
    Future<LocationData> loc = Location().getLocation();

    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
            primaryColor: const Color.fromARGB(255, 51, 121, 54),
            primarySwatch: Colors.green,
            scaffoldBackgroundColor: const Color.fromARGB(255, 247, 246, 246),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))))),
        home: const MyCustomForm());
  }
}
