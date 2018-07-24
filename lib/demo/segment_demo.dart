import 'package:flutter/material.dart';

class SegmentDemo extends StatefulWidget {
  static const String routeName = '/SegmentDemo';
  @override
  _SegmentDemoState createState() => _SegmentDemoState();
}

class _SegmentDemoState extends State<SegmentDemo>
    with TickerProviderStateMixin {
  TabController _controller;
  ScrollController _scrollController;
  @override
  void initState() {
    _controller = TabController(vsync: this, length: 9);
    _scrollController = ScrollController();
    super.initState();
    _controller.addListener(_clickTab);
    _scrollController.addListener(_scroll);
  }

  _clickTab() {
    print('_scrollController');
    // _scrollController.animateTo(200.0 * _controller.index,
    //     curve: Curves.bounceInOut, duration: Duration(microseconds: 500));
    print(_controller.index);
  }

  _scroll() {
    print(_scrollController);
    setState(() {
      if (_scrollController.offset < 200) {
        _controller.index != 0 &&
            _controller.animateTo(
              0,
              curve: Curves.ease,
              duration: Duration(milliseconds: 500),
            );
      }
      // if (_scrollController.offset <= 400 && _scrollController.offset >= 200) {
      //   _controller.index != 1 &&
      //       _controller.animateTo(
      //         1,
      //         curve: Curves.ease,
      //         duration: Duration(milliseconds: 500),
      //       );
      // }
      if (_scrollController.offset > 400) {
        _controller.index != 2 &&
            _controller.animateTo(
              3,
              curve: Curves.ease,
              duration: Duration(milliseconds: 500),
            );
      }
    });
    // if (_scrollController.hasClients) {

    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          controller: _controller,
          tabs: <Widget>[
            Tab(
              text: '11111111',
            ),
            Tab(
              text: '2222',
            ),
            Tab(
              text: '3333',
            ),
            Tab(
              text: '4444',
            ),
            Tab(
              text: '55545',
            ),
            Tab(
              text: '6666',
            ),
            Tab(
              text: '7777',
            ),
            Tab(
              text: '8888',
            ),
            Tab(
              text: '9999',
            ),
          ],
        ),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification note) {
          print(note);
        },
        // onPanEnd: (e) {
        //   print(e);
        //   print('1212');
        //   if (_scrollController.offset < 200) {
        //     _controller.index != 0 &&
        //         _controller.animateTo(
        //           0,
        //           curve: Curves.bounceInOut,
        //           duration: Duration(milliseconds: 500),
        //         );
        //   } else if (_scrollController.offset < 400 &&
        //       _scrollController.offset > 100) {
        //     _controller.index != 1 &&
        //         _controller.animateTo(
        //           1,
        //           curve: Curves.bounceInOut,
        //           duration: Duration(milliseconds: 500),
        //         );
        //   } else if (_scrollController.offset > 400) {
        //     _controller.index != 2 &&
        //         _controller.animateTo(
        //           6,
        //           curve: Curves.bounceInOut,
        //           duration: Duration(milliseconds: 500),
        //         );
        //   }
        // },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: <Widget>[
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Text('1212');
              }, childCount: 100),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Text('1212');
              }, childCount: 100),
            ),
          ],
        ),
      ),
    );
  }
}
