import 'package:flutter/material.dart';

class DefaultFormField extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  VoidCallback? onTapFunction;
  String? Function(String?)? onFieldSubmitted;
  TextInputType? textInputType;
  IconData? prefixIcon;
  bool isPassword;

  DefaultFormField({
    Key? key,
    this.hintText,
    this.isPassword = false,
    this.validator,
    this.onTapFunction,
    this.textInputType,
    this.controller,
    this.onFieldSubmitted,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.grey[400]),
      controller: controller,
      validator: validator,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        fillColor: Colors.grey[800],
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        filled: true,
      ),
      onTap: onTapFunction,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: textInputType,
    );
  }
}
