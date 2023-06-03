import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title, subtitle;
  const TopTitles({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
            //  height: kToolbarHeight + 20,
            ),
        if (title == "Login" || title == "Create Account")
          const BackButton(
            color: Colors.blue, //52s
          ),
        Text(
          title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    );
  }
}
