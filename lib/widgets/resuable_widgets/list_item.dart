import 'package:flutter/material.dart';


class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {

    final TextStyle defaultTextStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color,
      fontSize: Theme.of(context).textTheme.bodyLarge?.fontSize,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "- ",
            style: defaultTextStyle,
          ),
          Flexible(
            child: Text(
              "$title.",
              style: defaultTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
