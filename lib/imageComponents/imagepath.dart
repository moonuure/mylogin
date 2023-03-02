import 'package:flutter/material.dart';

class ImagePath extends StatelessWidget {
  final imagepth;
  final Function()? onTap;
  const ImagePath({super.key, required this.imagepth,
  required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[50]),
        child: Image(
          image: AssetImage(imagepth),
          height: 40,
        ),
      ),
    );
  }
}
