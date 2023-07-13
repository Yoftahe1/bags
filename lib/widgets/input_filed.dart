import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.type, required this.onSave});
  final String type;
  final void Function(String type, String newValue) onSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType:
              type == "Price" ? TextInputType.number : TextInputType.text,
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(borderSide: BorderSide()),
            border: const OutlineInputBorder(),
            hintText: 'Enter $type',
          ),
          validator: (value) {
            if (type == "Price") {
              if (value == null ||
                  value.isEmpty ||
                  int.tryParse(value) == null ||
                  int.tryParse(value)! <= 0) {
                return 'Please entre value > 0';
              }
            } else {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter some text';
              }
            }

            return null;
          },
          onSaved: (newValue) {
            onSave(type, newValue!);
          },
        ),
        const SizedBox(
          height: 7,
        ),
      ],
    );
  }
}
