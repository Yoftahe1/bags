import 'dart:io';

import 'package:flutter/material.dart';

class AddDisplay extends StatelessWidget {
  const AddDisplay(
      {super.key,
      required this.color,
      required this.pickColor,
      required this.image,
      required this.isImage});
  final Color color;
  final Function pickColor;
  final String? image;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
              decoration: BoxDecoration(
                color: color,
                border: !isImage
                    ? Border.all(color: const Color.fromARGB(255, 228, 38, 25))
                    : null,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 300),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  image == null
                      ? const SizedBox()
                      : Center(
                          child: Image.file(
                            File(image!),
                            fit: BoxFit.cover,
                          ),
                        ),
                  TextButton.icon(
                    label: const Text("Pick a color"),
                    icon: const Icon(Icons.brush_outlined),
                    onPressed: () {
                      pickColor();
                    },
                  )
                ],
              )),
        ),
        const SizedBox(height: 7),
        !isImage
            ? const Column(
                children: [
                  Text(
                    "Please provide an image",
                    style: TextStyle(
                        color: Color.fromARGB(255, 228, 38, 25),
                        fontSize: 11.5),
                  ),
                  SizedBox(height: 7),
                ],
              )
            : const SizedBox()
      ],
    );
  }
}
