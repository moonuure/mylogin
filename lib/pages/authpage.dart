import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mylogin/pages/login.dart';
import 'package:mylogin/pages/home.dart';
import 'package:mylogin/pages/RegisterPage.dart';
import 'package:mylogin/pages/register_or_login.dart';

class AurthPage extends StatelessWidget {
  const AurthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            // is user logged
            if (snapshot.hasData) {
              return HomePage();
            }

            // or NOT logged
            else {
              return RegorLogPage();
            }
          }),
        ),
      ),
    );
  }
}
