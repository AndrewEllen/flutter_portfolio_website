import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../open_url.dart';


class ListItem extends StatelessWidget {
  const ListItem({super.key, required this.title, this.url, this.content});
  final String title;
  final String? url;
  final String? content;

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
          url == null ? Flexible(
            child: Text(
              "$title.",
              style: defaultTextStyle,
            ),
          ) : const SizedBox.shrink(),
          url != null ? Flexible(
            child: RichText(
              text: TextSpan(
                text: title,
                style: defaultTextStyle.copyWith(color: Colors.blue),
                recognizer: TapGestureRecognizer()..onTap = () => openUrl(url: url!),
                children: [
                  TextSpan(
                    text: " || ",
                    style: defaultTextStyle
                  ),
                  TextSpan(
                      text: "$content.",
                      style: defaultTextStyle,
                  ),
                ]
              ),
            ),
          ) : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
