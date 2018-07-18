import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_playground/demo/all.dart';
import 'package:flutter_playground/gallery/demos.dart';
const double _kDemoItemHeight = 64.0;
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return FloatingActionButton(
    //   child: Text('1212'),
    //   onPressed: () {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => ThemeDemo()));
    //   },
    // );
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                kAllGalleryDemos.map((GalleryDemo demo) {
                  return _DemoItem(demo: demo);
                }).toList()
              ),
            )
          ],
        ),
      ),
    );
  }
}


class _DemoItem extends StatelessWidget {
  const _DemoItem({ Key key, this.demo }) : super(key: key);

  final GalleryDemo demo;

  void _launchDemo(BuildContext context) {
    if (demo.routeName != null) {
      Timeline.instantSync('Start Transition', arguments: <String, String>{
        'from': '/',
        'to': demo.routeName,
      });
      Navigator.pushNamed(context, demo.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);

    final List<Widget> titleChildren = <Widget>[
      new Text(
        demo.title,
        style: theme.textTheme.subhead.copyWith(
          color: isDark ? Colors.white : const Color(0xFF202124),
        ),
      ),
    ];
    if (demo.subtitle != null) {
      titleChildren.add(
        new Text(
          demo.subtitle,
          style: theme.textTheme.body1.copyWith(
            color: isDark ? Colors.white : const Color(0xFF60646B)
          ),
        ),
      );
    }

    return new RawMaterialButton(
      padding: EdgeInsets.zero,
      splashColor: theme.primaryColor.withOpacity(0.12),
      highlightColor: Colors.transparent,
      onPressed: () {
        _launchDemo(context);
      },
      child: new Container(
        constraints: new BoxConstraints(minHeight: _kDemoItemHeight * textScaleFactor),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 56.0,
              height: 56.0,
              alignment: Alignment.center,
              child: new Icon(
                Icons.ac_unit,
                size: 24.0,
                color: Colors.white,
              ),
            ),
            new Expanded(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: titleChildren,
              ),
            ),
            const SizedBox(width: 44.0),
          ],
        ),
      ),
    );
  }
}
