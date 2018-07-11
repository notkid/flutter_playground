import 'package:flutter/material.dart';
import 'package:flutter_playground/gallery/demos.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  Map<String, WidgetBuilder> _buildRoutes() {
    // For a different example of how to set up an application routing table
    // using named routes, consider the example in the Navigator class documentation:
    // https://docs.flutter.io/flutter/widgets/Navigator-class.html
    return Map<String, WidgetBuilder>.fromIterable(
      kAllGalleryDemos,
      key: (dynamic demo) => '${demo.routeName}',
      value: (dynamic demo) => demo.buildRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: _buildRoutes(),
      home: FloatingActionButton(
        child: Text('1212'),
        onPressed: (){Navigator.pushNamed(context, 'persistentSliver');},
      )
    );
  }
}