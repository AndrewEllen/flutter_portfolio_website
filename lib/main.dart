import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_portfolio_website/pages/about_page.dart';
import 'package:flutter_portfolio_website/pages/portfolio_page.dart';
import 'package:flutter_portfolio_website/providers/theme_provider.dart';
import 'package:flutter_portfolio_website/theme.dart';
import 'package:flutter_portfolio_website/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Andrew Ellen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      themeMode: context.watch<ThemeProvider>().themeMode,
      home: const MyHomePage(
        title: "Andrew Ellen",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController scrollController = ScrollController();

  int currentPageIndex = 0;


  List<Widget> pages = [
    const AboutPage(),
    const PortfolioPage(),
  ];


  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    bool desktopMode = shortestSide >= 600;

    return Scaffold(
      appBar: CustomAppBar(
        scrollController: scrollController,
        title: "Andrew Ellen",
      ),
      bottomNavigationBar: !desktopMode
          ? ClipRRect(
              child: Row(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return SlideTransition(
                        position: Tween(
                          begin: const Offset(0.0, -1.2),
                          end: const Offset(0.0, 0.0),
                        ).animate(animation),
                        child: child,
                      );
                    },
                    child: context.watch<ThemeProvider>().isScrolled
                        ? IconButton(
                            onPressed: () =>
                                context.read<ThemeProvider>().changeThemeMode(),
                            icon: const Icon(Icons.sunny),
                          )
                        : null,
                  ),
                  Expanded(
                    child: NavigationBar(
                      destinations: const [
                        NavigationDestination(
                          icon: Icon(Icons.person),
                          label: "About Me",
                        ),
                        NavigationDestination(
                          icon: Icon(Icons.book),
                          label: "Portfolio",
                        ),
                      ],
                      onDestinationSelected: (int index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      selectedIndex: currentPageIndex,
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
      body: Row(
        children: [
          desktopMode
              ? NavigationRail(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  leading: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return SlideTransition(
                        position: Tween(
                          begin: const Offset(0.0, -1.2),
                          end: const Offset(0.0, 0.0),
                        ).animate(animation),
                        child: child,
                      );
                    },
                    child: context.watch<ThemeProvider>().isScrolled
                        ? IconButton(
                            onPressed: () =>
                                context.read<ThemeProvider>().changeThemeMode(),
                            icon: const Icon(Icons.sunny),
                          )
                        : null,
                  ),
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(Icons.person),
                      label: Text("About Me"),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.book),
                      label: Text("Portfolio"),
                    ),
                  ],
                  onDestinationSelected: (int index) {
                    setState(() {
                      currentPageIndex = index;
                    });
                  },
                  selectedIndex: currentPageIndex,
                )
              : const SizedBox.shrink(),
          Expanded(
            child: ListView(
              shrinkWrap: false,
              controller: scrollController,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: pages[currentPageIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
