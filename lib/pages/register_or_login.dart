import 'package:flutter/material.dart';
import 'package:mylogin/pages/login.dart';
import 'package:mylogin/pages/RegisterPage.dart';

class RegorLogPage extends StatefulWidget {
  const RegorLogPage({super.key});

  @override
  State<RegorLogPage> createState() => _RegorLogPageState();
}

class _RegorLogPageState extends State<RegorLogPage> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onTap: togglePages);
    } else
      return RegisterPage(
        onTap: togglePages,
      );
  }
}
