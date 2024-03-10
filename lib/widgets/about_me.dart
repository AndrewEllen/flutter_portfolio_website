import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AboutMeWidget extends StatelessWidget {
  AboutMeWidget({super.key});


  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    bool desktopMode = shortestSide >= 850;

    print(shortestSide);

    final TextStyle defaultTextStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyMedium?.color,
      fontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [


        ///Display for mobile devices
        !desktopMode ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          //image: DecorationImage(
                          //  fit: BoxFit.fill,
                          //image: AssetImage(
                          //  "me.jpg",
                          //),
                          //)
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),
                Flexible(
                  flex: 4,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 300,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "Hey, I'm ",
                            style: defaultTextStyle,
                            children: [
                              TextSpan(
                                text: "Andrew",
                                style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const TextSpan(text: ". I'm a fullstack Software Developer with experience in creating and designing "
                                  "web and mobile apps."),
                            ]
                        )),
                  ),
                ),
                const Spacer(flex: 1),
              ],
            ),

          ],
        ) : const SizedBox.shrink(),



        ///Display for desktops/wider devices
        desktopMode ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Flexible(
              flex: 6,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 300,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          //image: DecorationImage(
                          //  fit: BoxFit.fill,
                            //image: AssetImage(
                            //  "me.jpg",
                            //),
                          //)
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 3,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 300,
                ),
                child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: "Hey, I'm ",
                        style: defaultTextStyle,
                        children: [
                          TextSpan(
                            text: "Andrew",
                            style: defaultTextStyle.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: ". I'm a fullstack Software Developer with experience in creating and designing "
                              "web and mobile apps."),
                        ]
                    )),
              ),
            ),
            const Spacer(flex: 1),
          ],
        ) : const SizedBox.shrink(),



      ],

    );
  }
}
