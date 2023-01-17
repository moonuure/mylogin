import 'package:flutter/material.dart';

class ImagePath extends StatelessWidget {
  final imagepth;
  const ImagePath({super.key, required this.imagepth});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[50]),
      child: Image(
        image: AssetImage(imagepth),
        height: 40,
      ),
    );
  }
}
