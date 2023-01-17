import 'package:flutter/material.dart';

class MyTextFeilds extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscoreText;
  final myTFIcons;

  MyTextFeilds(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscoreText,
      required this.myTFIcons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscoreText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
              ),
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            fillColor: Colors.grey.shade400,
            prefixIcon: myTFIcons,
            prefixIconColor: Color.fromARGB(255, 5, 97, 151),
            hintText: hintText,
            filled: true),
      ),
    );
  }
}
