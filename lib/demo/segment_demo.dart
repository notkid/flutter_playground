import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_playground/demo/stickhead/widget.dart';

class SegmentDemo extends StatefulWidget {
  static const String routeName = '/SegmentDemo';
  @override
  _SegmentDemoState createState() => _SegmentDemoState();
}

class _SegmentDemoState extends State<SegmentDemo>
    with TickerProviderStateMixin {
  TabController _controller;
  ScrollController _scrollController;
  List<double> postions;
  @override
  void initState() {
    _controller = TabController(vsync: this, length: 9);
    _scrollController = ScrollController();
    postions = List.filled(10, 0.0);
    super.initState();
    _controller.addListener(_clickTab);
    _buildList();
    // _scrollController.addListener(_scroll);
  }
  Future _buildList() async {
    print('12121');
    var msg = await rootBundle.loadString('assets/msg.json');
    print(msg);
    // List<dynamic> list = json.decode(msg);
    // List<MsgCard> msgList = MsgCard.parseAll(list);
    // return msgList;
  }
  _clickTab() {
    print('_scrollController');
    print(_scrollController);

    _scrollController.animateTo(postions[_controller.index],
        curve: Curves.bounceInOut, duration: Duration(microseconds: 500));
    print(_controller.index);
  }

  _scroll(int index, double stuckOffset) {
    print(index);
    setState(() {
      // _controller.index != index &&
      if (_controller.index != index) {
        if (_controller.indexIsChanging) {
          print('tttt');
        } else {
          if (stuckOffset != postions[_controller.index]) {

          _controller.index = index;
          }
          // _controller.animateTo(
          //   index,
          //   curve: Curves.ease,
          //   duration: Duration(milliseconds: 500),
          // );
        }
      }
    });
  }
  // _scroll() {
  //   print(_scrollController);
  //   setState(() {
  //     if (_scrollController.offset < 200) {
  //       _controller.index != 0 &&
  //           _controller.animateTo(
  //             0,
  //             curve: Curves.ease,
  //             duration: Duration(milliseconds: 500),
  //           );
  //     }
  //     // if (_scrollController.offset <= 400 && _scrollController.offset >= 200) {
  //     //   _controller.index != 1 &&
  //     //       _controller.animateTo(
  //     //         1,
  //     //         curve: Curves.ease,
  //     //         duration: Duration(milliseconds: 500),
  //     //       );
  //     // }
  //     if (_scrollController.offset > 400) {
  //       _controller.index != 2 &&
  //           _controller.animateTo(
  //             3,
  //             curve: Curves.ease,
  //             duration: Duration(milliseconds: 500),
  //           );
  //     }
  //   });
  //   // if (_scrollController.hasClients) {

  //   // }
  // }

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
          // print(note);
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
                return StickyHeader(
                  index: index,
                  postions: postions,
                  callback: _scroll,
                  header: Text('header${index + 1}', style: TextStyle(fontSize: 20.0),),
                  content: SizedBox(
                    height: 200.0,
                    child: Text(''),
                  ),
                );
              }, childCount: 10),
            ),
            // SliverList(
            //   delegate:
            //       SliverChildBuilderDelegate((BuildContext context, int index) {
            //     return Text('1212');
            //   }, childCount: 100),
            // ),
          ],
        ),
      ),
    );
  }
}

// class AnchorPart extends SingleChildRenderObjectWidget {
//    const AnchorPart({ Key key, this.child }) : super(key: key);

//   /// The widget below this widget in the tree.
//   ///
//   /// {@macro flutter.widgets.child}
//   final Widget child;

//   @override
//   SingleChildRenderObjectElement createElement() => new SingleChildRenderObjectElement(this);

//   @override
//   RenderObject createRenderObject(BuildContext context) {
//       // TODO: implement createRenderObject
//       return child;
//     }
// }
