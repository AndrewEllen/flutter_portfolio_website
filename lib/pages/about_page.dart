
import 'package:flutter/material.dart';

import '../widgets/about_me.dart';
import '../widgets/achievements_and_qualifications.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        AboutMeWidget(),
        SizedBox(height: 40,),
        AchievementsAndQualifications(),

      ],
    );
  }
}
