import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  CustomTextFormFieldWidget({super.key, required this.text, this.onChanged});
  final String text;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      onChanged: onChanged,
      focusNode: FocusNode(),
      decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white),
          )),
    );
  }
}
