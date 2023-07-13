import 'package:flutter/material.dart';

class AddElevatedButton extends StatelessWidget {
  const AddElevatedButton(
      {super.key,
      required this.color,
      required this.title,
      required this.onPress});
  final Color color;
  final String title;
  final void Function() onPress;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: color,
              foregroundColor: Colors.white),
          onPressed: onPress,
          child: Text(title)),
    );
  }
}
