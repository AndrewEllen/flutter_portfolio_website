
import 'package:flutter/material.dart';

import '../widgets/about_me.dart';
import '../widgets/achievements_and_qualifications.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        AboutMeWidget(),
        const SizedBox(height: 40,),
        const AchievementsAndQualifications(),

      ],
    );
  }
}
