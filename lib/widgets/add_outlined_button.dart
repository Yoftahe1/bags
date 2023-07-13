import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddOutlinedButton extends StatelessWidget {
  const AddOutlinedButton(
      {super.key,
      required this.label,
      required this.iconData,
      required this.pickImage});
  final String label;
  final IconData iconData;
  final void Function(ImageSource source) pickImage;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black,
              side: const BorderSide(color: Colors.black)),
          onPressed: () {
            if (label == "Take an image") {
              pickImage(ImageSource.camera);
            } else {
              pickImage(ImageSource.gallery);
            }
          },
          icon: Icon(iconData),
          label: Text(label)),
    );
  }
}
