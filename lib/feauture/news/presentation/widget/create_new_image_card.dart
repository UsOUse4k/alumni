import 'dart:io';

import 'package:flutter/material.dart';

class CreateNewImageCard extends StatelessWidget {
  const CreateNewImageCard({Key? key, required this.imagePath, required this.deleteImage})
      : super(key: key);

  final String imagePath;
  final Function() deleteImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 230,
          decoration: BoxDecoration(
            color: const Color(0xFFCCCCCC),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.file(
              File(imagePath),
              fit: BoxFit.cover,
              width: 200,
              height: 230,
            ),
          ),
        ),
        Positioned(
          top: -5,
          right: -5,
          child: IconButton(
            onPressed: deleteImage,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
