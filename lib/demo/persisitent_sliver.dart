import 'package:flutter/material.dart';
import 'dart:math' as math;
class PersistentSliverDemo extends StatefulWidget {
  static const String routeName = '/persistentSliver';
  @override
  _PersistentSliverDemoState createState() => _PersistentSliverDemoState();
}

class _PersistentSliverDemoState extends State<PersistentSliverDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('2323'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return Text('1212');
            }, childCount: 6),
          ),
          SliverPersistentHeader(
            delegate: _SliverTabBarDelegate(
              child: Text('123312'),
              minHeight: 10.0,
              maxHeight: 50.0,
            ),
            pinned: true,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return Text('1212');
            }, childCount: 136),
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override double get minExtent => minHeight;

  @override double get maxExtent => math.max(maxHeight, minHeight);

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight
        || minHeight != oldDelegate.minHeight
        || child != oldDelegate.child;
  }

  @override
  String toString() => '_SliverTabBarDelegate';
}