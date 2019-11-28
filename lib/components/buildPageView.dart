import 'package:flutter/material.dart';

class BuildPageView extends StatefulWidget {
  final PageController pageController;
  final List<Widget> items;
  final int initialPage;
  final bool keepPage;
  final double viewportFraction;
  final EdgeInsets itemPadding;
  BuildPageView({
    Key key,
    this.pageController,
    this.items,
    this.initialPage,
    this.keepPage,
    this.viewportFraction,
    this.itemPadding,
  });
  @override
  _BuildPageViewState createState() => _BuildPageViewState();
}

class _BuildPageViewState extends State<BuildPageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = widget.pageController != null
        ? widget.pageController
        : PageController(
            initialPage: widget.initialPage != null ? widget.initialPage : 0,
            keepPage: widget.keepPage != null ? widget.keepPage : true,
            viewportFraction:
                widget.viewportFraction != null ? widget.viewportFraction : 1);
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 12 / 9,
        // width: 100,
        // height: 100,
        child: PageView.builder(
          controller: widget.pageController,
          physics: BouncingScrollPhysics(),
          itemCount: widget.items.length,
          pageSnapping: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, position) {
            // print(position);
            return Container(
              child: widget.items[position],
              padding: widget.itemPadding != null ? widget.itemPadding : null,
            );
          },
        ),
      ),
    );
  }
}
