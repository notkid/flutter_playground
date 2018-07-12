import 'package:flutter/material.dart';
import 'package:flutter_playground/demo/persisitent_sliver.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text('1212'),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => new PersistentSliverDemo()));
      },
    );
  }
}
