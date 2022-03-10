import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    this.imagePath,
    this.imageRadius = 20.0,
  }) : super(key: key);

  final double imageRadius;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
    backgroundColor: Colors.grey[50],
      radius: imageRadius,
      child: CircleAvatar(
        radius: imageRadius - 4,
        backgroundImage: AssetImage(imagePath!),
      ),
    );
  }
}
