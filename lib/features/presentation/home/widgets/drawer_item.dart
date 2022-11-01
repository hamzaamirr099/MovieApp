import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItem extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTapFunction;
  const DrawerItem({Key? key, required this.imagePath, required this.text, required this.onTapFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Row(
        children: [
          SvgPicture.asset(imagePath),
          const SizedBox(width: 20,),
          Text(text),
        ],
      ),
    );
  }
}
