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
    _controller = TabController(vsync: this, length: 3);
    _scrollController = ScrollController();
    super.initState();
    _controller.addListener(_clickTab);
    _scrollController.addListener(_scroll);
  }
  _clickTab() {
    print(_scrollController);
    _scrollController.animateTo(200.0 * _controller.index, curve: Curves.bounceInOut, duration: Duration(microseconds: 500));
    print(_controller.index);
  }
  _scroll() {
    print(_scrollController);
    if (_scrollController.hasClients) {
      if (_scrollController.offset < 200) {
        _controller.index != 0 && _controller.animateTo(0, curve: Curves.bounceInOut, duration: Duration(milliseconds: 500),);
      } 
       if (_scrollController.offset < 400 && _scrollController.offset > 100) {
        _controller.index != 1 && _controller.animateTo(1, curve: Curves.bounceInOut, duration: Duration(milliseconds: 500),);
      }
      if (_scrollController.offset > 400) {
        _controller.index != 2 && _controller.animateTo(2, curve: Curves.bounceInOut, duration: Duration(milliseconds: 500),);
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _controller,
          tabs: <Widget>[
            Tab(text: '1111',),
            Tab(text: '2222',),
            Tab(text: '3333',),
          ],
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('2323'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('555'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('111'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
                Text('12121212'),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
