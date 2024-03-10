import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/widgets/resuable_widgets/list_item.dart';
import '../open_url.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

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
              child: RichText(
                text: TextSpan(
                  text: "Check out my GitHub!",
                  style: defaultTextStyle.copyWith(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap =
                        () => openUrl(url: "https://github.com/AndrewEllen"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Portfolio",
                style: defaultTextStyle,
              ),
            ),
            const ListItem(
              title: "FIT",
              content:
                  "A fitness and diet tracker written in Dart in the Flutter framework",
              url: "https://github.com/AndrewEllen/fitness_tracker",
            ),
            const ListItem(
              title:
                  "PEAK || A fitness based social media app written in Dart in the Flutter framework",
            ),
            const ListItem(
              title:
                  "TerraCare || A browser extension aimed at providing info on similar, energy sustainable products",
            ),
            const ListItem(
              title: "SHARON AI",
              content:
                  "A personal assistant utilising METAs WIT.AI platform to train an ML model that recognises sentiment and traits and using Python to process and return an output",
              url: "https://github.com/AndrewEllen/SHARONAI",
            ),
            const ListItem(
              title: "Flutter Portfolio website",
              content:
                  "The website you're currently on! Written in Flutter and Dart",
              url: "https://github.com/AndrewEllen/flutter_portfolio_website",
            ),
            const ListItem(
                title:
                    "Auto-Mate || A workflow optimisation tool written in Python using Tkinter for user interfaces. The tool features parallel processing as well as speech to text recognition using OpenAIs whisper package and featuring CUDA acceleration. The tool allows near real-time transcription of audio as well as the ability to generate things such as questions based on the transcription and a summary of the full transcription"),
            const ListItem(
                title:
                    "RLGym quickstart fork",
                content: "A fork of the RLGym repository, a project that uses machine learning to train an AI to play Rocket League",
                url: "https://github.com/AndrewEllen/rlgym_quickstart_fork"
            ),
          ],
        ),
      ),
    );
  }
}
