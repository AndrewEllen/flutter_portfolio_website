
import 'dart:ui';
import 'package:flutter/material.dart';

import '../widgets/about_me.dart';
import '../widgets/achievements_and_qualifications.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {

    double shortestSide = MediaQuery.of(context).size.shortestSide;
    bool phoneMode = shortestSide < 850;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Stack(
          children: [

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: phoneMode ? 610 : 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: phoneMode ? BoxFit.fitHeight : BoxFit.fitWidth,
                    image: AssetImage(
                      "assets/background.jpg",
                    ),
                  )
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: phoneMode ? 620 : 310,
                decoration: const BoxDecoration(),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),

            const AboutMeWidget(),
          ],
        ),
        SizedBox(height: 40,),
        AchievementsAndQualifications(),

      ],
    );
  }
}
