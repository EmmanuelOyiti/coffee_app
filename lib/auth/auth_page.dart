import 'package:flutter/material.dart';
import 'package:gihoc_mobile/auth/pages/login_page.dart' as login;
import 'package:gihoc_mobile/auth/pages/register_page.dart' as register;



class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // Show Login by default
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return login.LoginPage(showRegisterPage: togglePages);
    } else {
      return register.RegisterPage(showLoginPage: togglePages);
    }
  }
}
