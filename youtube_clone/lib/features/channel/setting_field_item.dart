import 'package:flutter/material.dart';

class SettingItems extends StatelessWidget {
  final String identifier;
  final String value;
  final VoidCallback onPressed;
  const SettingItems(
      {super.key,
      required this.identifier,
      required this.value,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 14,
        top: 6,
        bottom: 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                identifier,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(value),
              
            ],
          ),

          GestureDetector(
                onTap: onPressed,
                child: Image.asset(
                  'assets/icons/pen.png',
                  height: 21,
                ),
              ),
        ],
      ),
    );
  }
}
