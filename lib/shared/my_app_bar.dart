import 'package:effective_mobile_test_tasck/shared/text__sf_pro_14__widget.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  int screen;
  MyAppBar({super.key, required this.title, this.screen = 0});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          title: Transform.translate(
              offset: Offset(
                  screen == 1
                      ? -29.0
                      : screen == 2
                          ? -30.0
                          : screen == 3
                              ? -33.0
                              : 0,
                  0),
              child: Center(child: Text(title))),
          toolbarHeight: 57,
        ),
      ],
    );
    // AppBar(
    //   backgroundColor: Colors.white,
    //   title: Positioned.fill(left: 10, child: Text(title)),
    //   toolbarHeight: 57,
    // );
  }
}
