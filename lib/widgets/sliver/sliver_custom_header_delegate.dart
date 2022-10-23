import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:flutter/material.dart';

// ref: https://developpaper.com/create-interesting-scrolling-effects-in-flutter-sliver-series/
class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  SliverCustomHeaderDelegate({
    required this.collapsedHeight,
    required this.expandedHeight,
    required this.paddingTop,
    required this.body,
    required this.title,
    this.actions = const [],
  });

  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final Widget body;
  final Widget title;
  final List<Widget> actions;

  @override
  double get minExtent => collapsedHeight + paddingTop;

  @override
  double get maxExtent => expandedHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Color makeStickyHeaderBgColor(double shrinkOffset) {
    final alpha =
        (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }

  Color makeStickyHeaderTextColor(double shrinkOffset, bool isIcon) {
    if (shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final alpha =
          (shrinkOffset / (maxExtent - minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxExtent,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          // Container(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
          Positioned(
            top: collapsedHeight + paddingTop + 8,
            left: 0,
            right: 0,
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //     Text('Hello Tititle'),
            //   ],
            // ),
            child: body,
          ),
          // Put your head back
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: makeStickyHeaderBgColor(shrinkOffset), // Background color
              child: SafeArea(
                bottom: false,
                child: SizedBox(
                  height: collapsedHeight,
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(
                          AppIcons.ic_chevron_left,
                          // color: this.makeStickyHeaderTextColor(
                          //     shrinkOffset, true), // Return icon color
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      // Text(
                      //   this.title,
                      //   style: TextStyle(
                      //     fontSize: 20,
                      //     fontWeight: FontWeight.w500,
                      //     color: this.makeStickyHeaderTextColor(
                      //         shrinkOffset, false), // Title color
                      //   ),
                      // ),
                      Expanded(
                        child: Opacity(
                          opacity: shrinkOffset / expandedHeight,
                          child: title,
                        ),
                      ),
                      Row(
                        children: actions.map((e) => e).toList(),
                      ),
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.share,
                      //     // color: this.makeStickyHeaderTextColor(
                      //     //     shrinkOffset, true), // Share icon color
                      //   ),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
