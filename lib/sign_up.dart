import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main_page.dart';

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.

  DatabaseReference database = FirebaseDatabase.instance.ref("Users");

  final email = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final gender = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String user_email = "";
  String user_name = "";
  String user_phone = "";
  String user_gender = "";

  void _getText() {
    setState(() {
      user_email = email.text;
      user_name = name.text;
      user_phone = phone.text;
      user_gender = gender.text;
    });
  }

  void get_user_cords() {}

  void submit_user() async {
    await database.push().set({
      "email": user_email,
      "name": user_name,
      "phone": user_phone,
      "gender": user_gender
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          centerTitle: true,
          title: const Text('Bar Push'),
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       labelText: 'Enter your email',
                    ),
                      controller: email,
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       labelText: 'Enter your name',
                    ),
                    controller: name,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       labelText: 'Enter your phone number',
                    ),
                    controller: phone,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    decoration: const InputDecoration(
                       border: OutlineInputBorder(),
                       labelText: 'Enter your gender',
                    ),
                    controller: gender,
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _getText();
                submit_user();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyApp2()));
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            )
          ],
        ));
  }
}
