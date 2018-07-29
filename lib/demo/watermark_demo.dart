import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WatermarkDemo extends StatefulWidget {
  static const String routeName = '/WatermarkDemo';
  @override
  _WatermarkDemoState createState() => _WatermarkDemoState();
}

class _WatermarkDemoState extends State<WatermarkDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('painter'),
      ),
      body: SizedBox(
        height: 800.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Watermark(
            mark: '张三三',
            color: Color(0xFFCCCCCC),
            child: ClipRect(
              child: Container(
                child: Stack(children: [
                  SizedBox(
                    height: 200.0,
                    width: 400.0,
                    child: Text(
                      'demo112demo112demo112demo112demo112demo112demo112demo112demo112demo112demo112demo112demo112',
                      style: TextStyle(
                        color: Colors.pink,
                      ),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Watermark extends StatelessWidget {
  Watermark({
    this.mark,
    this.color,
    this.child,
  });
  final String mark;
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        foregroundPainter: _Painter(mark: mark),
        child: child,
      ),
    );
  }
}

class _Painter extends CustomPainter {
  ui.Paragraph _paragraph;
  _Painter({
    this.mark,
    this.color,
    this.fontSize = 14.0,
  });
  final String mark;
  final Color color;
  final double fontSize;
  @override
  void paint(Canvas canvas, Size size) {
    final widgetWidth = size.width;
    final widgetHeight = size.height;
    final ui.ParagraphBuilder paragraphBuilder = new ui.ParagraphBuilder(
        new ui.ParagraphStyle(textDirection: TextDirection.ltr))
      ..pushStyle(ui.TextStyle(
        color: color,
        letterSpacing: 8.0,
        fontSize: fontSize,
      ))
      ..addText(mark);
    int rows = (widgetHeight / 80.0).round();
    int columns = (widgetWidth + 400.0 / 66.0).round();
    double indent = (widgetWidth / 6);
    _paragraph = paragraphBuilder.build()
      ..layout(ui.ParagraphConstraints(width: size.width));
    canvas.rotate(-0.5);
    for (var i = 0; i < rows; i++) {
      for (var j = 0; j < columns; j++) {
        canvas.drawParagraph(
          _paragraph,
          Offset(
            -200.0 + (indent + 66) * j,
            0.0 + 80 * i + 24 * j,
          ),
        );
      }
    }
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return true;
  }
}
