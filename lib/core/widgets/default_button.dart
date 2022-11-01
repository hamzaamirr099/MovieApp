import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String buttonText;
  IconData? buttonIcon;
  Color? backgrounColor;
  final VoidCallback onPressed;
  double? height;
  double? width;
  double? borderRadius;

  DefaultButton({
    Key? key,
    this.backgrounColor = Colors.red,
    required this.onPressed,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 10.0,
    this.buttonIcon,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgrounColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
