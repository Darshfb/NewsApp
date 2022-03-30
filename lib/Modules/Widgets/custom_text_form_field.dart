import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController? controller;
  FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;
  String? labelText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  String? hintText;
  bool? isDense;
  TextInputType? keyBoardType;

  CustomTextFormField(
      {this.controller,
      this.validator,
      this.onChanged,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.keyBoardType,
      this.isDense});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyBoardType,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        hintText: hintText,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(25.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(25.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(25.0),
        ),
        labelText: labelText,
        isDense: isDense,
      ),
    );
  }
}
