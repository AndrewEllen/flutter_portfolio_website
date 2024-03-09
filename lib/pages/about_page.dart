
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Text(
          "I'm a full-stack developer",
          style: TextStyle(
            fontSize: 24,
          ),
        ),

      ],
    );
  }
}
