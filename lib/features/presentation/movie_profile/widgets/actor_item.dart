import 'package:flutter/material.dart';

class ActorItem extends StatelessWidget {
  final String actorImage;
  final String actorName;

  const ActorItem({Key? key, required this.actorImage, required this.actorName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: actorImage.contains('null')
              ? Image.asset('assets/images/no_image.png', fit: BoxFit.cover, width: 130,)
              : Image.network(
                  actorImage,
                  fit: BoxFit.cover,
                  width: 130,
                ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          actorName,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
