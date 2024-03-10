
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../theme.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.scrollController, required this.title});
  late ScrollController scrollController;
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}

class _CustomAppBarState extends State<CustomAppBar> {

  late ScrollController scrollController;
  late bool _display = true;

  @override
  void initState() {

    scrollController = widget.scrollController;

    scrollController.addListener(() => scrollListener());

    super.initState();
  }

  void scrollListener() {

    if (scrollController.position.userScrollDirection == ScrollDirection.forward && !_display) {

      print("Forward");

      setState(() {
        _display = true;
      });

      context.read<ThemeProvider>().changeScrollState(false);

    }

    if (scrollController.position.userScrollDirection == ScrollDirection.reverse && _display) {

      print("Reverse");

      setState(() {
        _display = false;
      });

      context.read<ThemeProvider>().changeScrollState(true);

    }

  }

  @override
  void dispose() {

    scrollController.dispose();

    super.dispose();
  }

  Duration duration = const Duration(milliseconds: 250);

  @override
  Widget build(BuildContext context) {

    var shortestSide = MediaQuery.of(context).size.shortestSide;
    bool phoneMode = shortestSide < 600;

    if (!context.watch<ThemeProvider>().isScrolled) {
      _display = true;
    }

    return _display ? TweenAnimationBuilder(
      tween: Tween<double>(begin: 0 , end: widget.preferredSize.height),
      duration: duration,
      builder: (BuildContext context, double value, Widget? child) {
        return SizedBox(
          height: value,
          child: AppBar(
            elevation: 2,
            actions: phoneMode ? [IconButton(
              onPressed: () => context.read<ThemeProvider>().changeThemeMode(),
              icon: const Icon(
                Icons.sunny,
                color: Colors.white,
              ),
            )] : [AnimatedSwitcher(
              duration: duration,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              child: !context.watch<ThemeProvider>().isScrolled ? Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  onPressed: () => context.read<ThemeProvider>().changeThemeMode(),
                  icon: const Icon(
                    Icons.sunny,
                    color: Colors.white,
                  ),
                ),
              ) : null,
            )],
            automaticallyImplyLeading: false,
            backgroundColor: appBarColour,
            title: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    ) : TweenAnimationBuilder(
      tween: Tween<double>(begin: widget.preferredSize.height , end: 0),
      duration: duration,
      builder: (BuildContext context, double value, Widget? child) {
        return SizedBox(
          height: value,
          child: AppBar(
            actions: phoneMode ? [IconButton(
              onPressed: () => context.read<ThemeProvider>().changeThemeMode(),
              icon: const Icon(
                Icons.sunny,
                color: Colors.white,
              ),
            )] : [AnimatedSwitcher(
              duration: duration,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween(
                    begin: const Offset(0.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              },
              child: !context.watch<ThemeProvider>().isScrolled ? Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: IconButton(
                  onPressed: () => context.read<ThemeProvider>().changeThemeMode(),
                  icon: const Icon(
                    Icons.sunny,
                    color: Colors.white,
                  ),
                ),
              ) : null,
            )],
            automaticallyImplyLeading: false,
            backgroundColor: appBarColour,
            title: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
