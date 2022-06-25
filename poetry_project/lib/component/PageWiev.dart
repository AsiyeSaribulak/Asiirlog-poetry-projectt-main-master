import 'package:flutter/material.dart';

class PageWiev extends StatefulWidget {
  const PageWiev({Key? key}) : super(key: key);

  @override
  State<PageWiev> createState() => _PageWievState();
}

class _PageWievState extends State<PageWiev> {
  @override
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: false);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Expanded(
        child: PageView.custom(
            controller: _pageController,
            reverse: false,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            pageSnapping: false,
            childrenDelegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                alignment: Alignment.center,
                color: index % 2 == 0
                    ? Color.fromARGB(157, 252, 181, 246)
                    : Color.fromARGB(235, 206, 255, 251), //[100 * (index % 5)]
                child: Text("sayfa $index"),
              );
            })),
      )
    ]));
  }
}
