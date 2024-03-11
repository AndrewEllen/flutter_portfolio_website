import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/widgets/resuable_widgets/list_item.dart';

class AchievementsAndQualifications extends StatelessWidget {
  const AchievementsAndQualifications({super.key});

  @override
  Widget build(BuildContext context) {

    final TextStyle defaultTextStyle = TextStyle(
      color: Theme.of(context).textTheme.titleLarge?.color,
      fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
      fontWeight: FontWeight.bold,
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Experience and Achievements",
                style: defaultTextStyle,
              ),
            ),
            const ListItem(title: "BSc in Software Development"),
            const ListItem(title: "First Place in the Energy Sustainability category for the IBM 2020 Call for Code Spot Challenge || Team TerraCare"),
            const ListItem(title: "HNC in Aircraft Engineering"),
            const ListItem(title: "Experience with multiplatform development frameworks for mobile and web || Vue, React, Flutter, Unity"),
            const ListItem(title: "Experience developing the back end of an application and integrating it with the front end"),
            const ListItem(title: "Experience with database design and integration"),
            const ListItem(title: "Experience with artificial intelligence and machine learning"),
            const ListItem(title: "Experience with multiplayer game development"),
            const ListItem(title: "Bronze Duke of Edinburgh"),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Programming Language and Framework Experience (Non-Professional)",
                style: defaultTextStyle,
              ),
            ),
            const ListItem(title: "Flutter and Dart"),
            const ListItem(title: "HTML, CSS, JS"),
            const ListItem(title: "Vue"),
            const ListItem(title: "React"),
            const ListItem(title: "Python"),
            const ListItem(title: "C#"),
            const ListItem(title: "C++"),
            const ListItem(title: "Java"),
          ],

        ),
      ),
    );
  }
}
