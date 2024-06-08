import 'package:flutter/material.dart';
import 'package:youtube_clone/cores/colors.dart';

class ImageButton extends StatelessWidget {
  final String image;
  final bool haveColor;
  final double height;
  final VoidCallback onPressed;
  const ImageButton({
    super.key,
    required this.image,
    required this.haveColor,
    required this.height,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4),
        child: Container(
          padding: const EdgeInsets.only(top: 7.6, bottom: 7.6),
          decoration: BoxDecoration(
            color: haveColor ? softBlueGreyBackGround : null,
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Image.asset('assets/icons/$image', height: height),
        ),
      ),
    );
  }
}
