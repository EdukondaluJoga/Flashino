import 'package:firebase_core/firebase_core.dart';
import 'package:flashino/Pages/chats_page.dart';
import 'package:flashino/Pages/login_page.dart';
import 'package:flashino/Pages/registration_page.dart';
import 'package:flashino/Pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance;
  await Firebase.initializeApp();
  runApp(const Flashino());
}

class Flashino extends StatelessWidget {
  const Flashino({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        RegistrationPage.id: (context) => RegistrationPage(),
        ChatPage.id: (context) => ChatPage(),
      },
    );
  }
}
