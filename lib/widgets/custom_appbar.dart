
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

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

    if (scrollController.position.pixels == scrollController.position.minScrollExtent) {

      print("top");

      setState(() {
        _display = true;
      });

    }

    if (scrollController.position.pixels > scrollController.position.minScrollExtent && _display) {

      print("scrolled");

      setState(() {
        _display = false;
      });

    }

  }

  @override
  void dispose() {

    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _display ? TweenAnimationBuilder(
      tween: Tween<double>(begin: 0 , end: widget.preferredSize.height),
      duration: const Duration(milliseconds: 100),
      builder: (BuildContext context, double value, Widget? child) {
        return SizedBox(
          height: value,
          child: AppBar(
            leading: IconButton(
              onPressed: () => context.read<ThemeProvider>().changeThemeMode(),
              icon: const Icon(Icons.sunny),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(1),
            title: Text(widget.title),
          ),
        );
      },
    ) : TweenAnimationBuilder(
      tween: Tween<double>(begin: widget.preferredSize.height , end: 0),
      duration: const Duration(milliseconds: 100),
      builder: (BuildContext context, double value, Widget? child) {
        return SizedBox(
          height: value,
          child: AppBar(
            leading: IconButton(
              onPressed: () => context.read<ThemeProvider>().changeThemeMode(),
              icon: const Icon(Icons.sunny),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(1),
            title: Text(widget.title),
          ),
        );
      },
    );
  }
}
