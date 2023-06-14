import 'package:flutter/material.dart';

class ImageWithTextOverlay extends StatelessWidget {
  final String image;
  final String name;
  const ImageWithTextOverlay({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 70,
          left: 30,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.black.withOpacity(0.5),
            child: Text(
             name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
