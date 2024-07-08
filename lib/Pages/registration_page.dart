import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashino/Pages/chats_page.dart';
import 'package:flashino/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flashino/components/constraints.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  static const String id = 'registration_page';

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _auth = FirebaseAuth.instance;
  bool ShowSpinner = false;
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: ShowSpinner,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                  //Do something with the user input.
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your Email'),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Password'),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: Colors.blueAccent,
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () async {
                      setState(() {
                        ShowSpinner = true;
                      });
                      try {
                        final NewUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (NewUser != null) {
                          Navigator.pushNamed(context, ChatPage.id);
                          setState(() {
                            ShowSpinner = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                      //Implement registration functionality.
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Text('Do you already have an account ?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: Text('sign in here'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
