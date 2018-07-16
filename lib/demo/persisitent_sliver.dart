import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];
final Widget placeholder = new Container(color: Colors.grey);

class PersistentSliverDemo extends StatefulWidget {
  static const String routeName = '/persistentSliver';
  @override
  _PersistentSliverDemoState createState() => _PersistentSliverDemoState();
}

class _PersistentSliverDemoState extends State<PersistentSliverDemo>
    with SingleTickerProviderStateMixin {
  CarouselSlider instance;
  TabController _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    instance = new CarouselSlider(
      items: imgList.map((url) {
        return new Container(
            margin: new EdgeInsets.all(5.0),
            child: new ClipRRect(
                borderRadius: new BorderRadius.all(new Radius.circular(10.4)),
                child: new CachedNetworkImage(
                  imageUrl: url,
                  placeholder: placeholder,
                  fit: BoxFit.cover,
                  width: 1000.0,
                )));
      }).toList(),
      viewportFraction: 0.9,
      aspectRatio: 2.0,
      autoPlay: true,
    );
    return SafeArea(
      top: true,
      child: Scaffold(
        key: _scaffoldKey,
        // appBar: AppBar(
        //   primary: true,
        //   title: Text('2323'),
        // ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.blue,
              pinned: false,
              expandedHeight: 200.0,
              flexibleSpace: FlexibleSpaceBar(
                background: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                  ),
                  child: SizedBox(
                      height: 240.0,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          child: instance)),
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: _SliverTabBarDelegate(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: TabBar(
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorPadding:
                              EdgeInsets.only(left: 28.6, right: 28.6),
                          labelStyle: TextStyle(
                              fontSize: 16.7, fontWeight: FontWeight.w600),
                          // unselectedLabelColor: kVasFontAccentColor,
                          controller: _tabController,
                          labelColor: Colors.orange,
                          tabs: [
                            new Tab(text: '当日'),
                            new Tab(text: '本周'),
                            new Tab(text: '本月'),
                          ]),
                    )),
                minHeight: 50.0,
                maxHeight: 60.0,
              ),
              pinned: true,
              floating: true,
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return TextFormField(
                  keyboardType: TextInputType.phone,
                  autofocus: true,
                );
              }, childCount: 20, addRepaintBoundaries: false),
            ),
          ],
        ),
        bottomSheet: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: SizedBox(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
                child: Text('bottomSheet'))),
        resizeToAvoidBottomPadding: false,
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('1212'),));
            // _scaffoldKey.currentState.showSnackBar(
            //   SnackBar(content: Text('Eddddd'),),
            // );
          },
          child: Icon(Icons.add),
        ),
        persistentFooterButtons: <Widget>[
          FlatButton(onPressed: (){}, child: Text('persistentFooterButtonsA'),),
          FlatButton(onPressed: (){}, child: Text('G'),),
        ],
        backgroundColor: Colors.green,
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text('BottomNavigationBarItemA'),
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              title: Text('BottomNavigationBarItemB'),
              icon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              title: Text('BottomNavigationBarItemC'),
              icon: Icon(Icons.add),
            ),
          ],
        )
      ),
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
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

  @override
  String toString() => '_SliverTabBarDelegate';
}
