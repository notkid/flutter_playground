// import 'package:app_login/src/screens/styles.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_playground/demo/styles.dart';


class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.buttonController})
      : buttonSqueezeanimation = new Tween(
          begin: 320.0,
          end: 70.0,
        )
            .animate(
          new CurvedAnimation(
            parent: buttonController,
            curve: new Interval(
              0.0,
              0.150,
            ),
          ),
        ),
        containerCircleAnimation = new EdgeInsetsTween(
          begin: const EdgeInsets.only(top: 0.0),
          end: const EdgeInsets.only(top: 30.0),
        )
            .animate(
          new CurvedAnimation(
            parent: buttonController,
            curve: new Interval(
              0.500,
              0.800,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  final AnimationController buttonController;
  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeanimation;
  final Animation buttomZoomOut;

  Future<Null> _playAnimation() async {
    try {
      await buttonController.forward();
      // await buttonController.reverse();
    } on TickerCanceled {}
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return new Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: new InkWell(
          onTap: () {
            _playAnimation();
          },
          child: new Hero(
            tag: "fade",
            child: new Container(
                    width: buttonSqueezeanimation.value,
                    height: 70.0,
                    alignment: FractionalOffset.center,
                    decoration: new BoxDecoration(
                      color: login_button_color,
                      borderRadius: new BorderRadius.all(const Radius.circular(35.0)),
                    ),
                    child: buttonSqueezeanimation.value > 75.0
                        ? new Text(
                            "Sign In",
                            style: new TextStyle(
                              color: login_word_color,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.3,
                            ),
                          )
                        : new CircularProgressIndicator(
                                value: null,
                                strokeWidth: 1.0,
                                valueColor: new AlwaysStoppedAnimation<Color>(
                                    login_word_color),
                              ))
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    buttonController.addListener(() {
      // if (buttonController.isCompleted) {
      //   Navigator.pushNamed(context, "/home");
      // }
    });
    return new AnimatedBuilder(
      builder: _buildAnimation,
      animation: buttonController,
    );
  }
}
