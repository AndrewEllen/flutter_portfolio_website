
import 'package:flutter/material.dart';

import '../widgets/portfolio_section.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectionArea(
      child: Column(
        children: [
      
          PortfolioSection(),
      
        ],
      ),
    );
  }
}
