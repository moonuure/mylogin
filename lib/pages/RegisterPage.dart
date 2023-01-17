import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mylogin/TFcomponents/my_button.dart';
import '../TFcomponents/tetx_field.dart';
import '../TFcomponents/my_button.dart';
import '../imageComponents/imagepath.dart';

class RegisterPage extends StatefulWidget {
  final Function() onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final CofirmpasswordController = TextEditingController();

  void SigUpUser() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    try {
      if (passwordController.text == CofirmpasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: usernameController.text, password: passwordController.text);
      } else {
        WrongMessage("Password not match");
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);

      WrongMessage(e.code);
    }
  }

  void WrongMessage(String message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(child: Text(message)),
          );
        });
  }

  void regigterUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              // icon
              Center(
                  child: Icon(
                Icons.lock,
                size: 100,
                color: Color.fromARGB(255, 5, 97, 151),
              )),
              SizedBox(
                height: 30,
              ),

              Text(
                'Create New User',
                style: TextStyle(
                    fontSize: 25, color: Color.fromARGB(255, 5, 97, 151)),
              ),
              SizedBox(
                height: 30,
              ),

              // textField.....user

              MyTextFeilds(
                controller: usernameController,
                myTFIcons: Icon(Icons.lock),
                hintText: 'username',
                obscoreText: false,
              ),
              SizedBox(
                height: 30,
              ),
              //textfield......pass
              MyTextFeilds(
                controller: passwordController,
                myTFIcons: Icon(Icons.key),
                hintText: 'password',
                obscoreText: true,
              ),
              SizedBox(
                height: 10,
              ),
              //Confirm Password
              SizedBox(
                height: 20,
              ),
              //textfield......pass
              MyTextFeilds(
                controller: CofirmpasswordController,
                myTFIcons: Icon(Icons.key),
                hintText: 'Confirm password',
                obscoreText: true,
              ),
              SizedBox(
                height: 10,
              ),

              //forgetpass
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //loginButton........
              MyButton(
                onTap: SigUpUser,
                textOnButton: 'Sig Up',
              ),
              SizedBox(
                height: 25,
              ),
              //or conteniue with already acoount///
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1.5,
                    )),
                    Text(
                      "Or continue with",
                      style: TextStyle(
                          fontSize: 20, color: Color.fromARGB(255, 5, 97, 151)),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),

              //google + firebase icons...........
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImagePath(imagepth: 'images/googleicon.png'),
                  SizedBox(
                    width: 25,
                  ),
                  ImagePath(imagepth: 'images/fbicon.png')
                ],
              ),
              SizedBox(
                height: 25,
              ),
              //not member register.............
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'All ready have an Accont: ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                          color: Color.fromARGB(255, 5, 97, 151),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
