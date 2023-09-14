import 'package:flutter/material.dart';


class IconWithLable extends StatelessWidget {
  final IconData icon;
  final String lable;
  const IconWithLable({
    required this.icon,
    required this.lable,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
           ),
        Text(
         lable,
         style: const TextStyle(
           fontSize: 16,
           fontWeight: FontWeight.bold,
         ),

        )
      ],
    );
  }
}
