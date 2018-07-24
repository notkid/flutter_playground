import 'dart:convert';
import 'package:flutter/material.dart';
import 'styles.dart';
import 'animation.dart';
import 'animationFull.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

const Color _hintColor = Color(0xFFA5DDE1);
const TextStyle _hintTextStyle =
    const TextStyle(color: _hintColor, fontSize: 14.0);
const _contentPadding =
    const EdgeInsets.only(top: 30.0, right: 30.0, bottom: 30.0, left: 5.0);

class LoginScreen extends StatefulWidget{
  static const String routeName = '/loginAnimation';
  final String currentCompany;
  final Function(bool) changeloginStatus;

  LoginScreen({Key key, this.currentCompany, this.changeloginStatus});

  @override
  LoginScreenState createState() =>
      new LoginScreenState(currentCompany, changeloginStatus);
}

class LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  LoginScreenState(this.currentCompany, this.changeloginStatus);
  String currentCompany;
  final Function(bool) changeloginStatus;
  AnimationController _loginButtonController;
  AnimationController _loginButtonControllerFull;

  var animationStatus = 0;

  @override
  initState() {
    super.initState();
    _loginButtonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);
    _loginButtonControllerFull = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void dispose() {
    _loginButtonController.dispose();
    super.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await _loginButtonController.forward();
      await _loginButtonController.reverse();
    } on TickerCanceled {}
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          child: new AlertDialog(
            title: new Text('Are you sure?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              new FlatButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, "/home"),
                child: new Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  bool _autovalidate = false;

  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _companyNameKey =
      new GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _usernameKey =
      new GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _passwordformKey =
      new GlobalKey<FormFieldState<String>>();
  Future<Null> _handleSubmitted(BuildContext context) async {
    final FormState form = _formKey.currentState;
    if (!form.validate()) {
      _autovalidate = true;
      showInSnackBar('fix error');
    } else {
      setState(() {
        animationStatus = 1;
      });
      await _loginButtonController.forward();
      Map<String, String> params = new Map();
      params['companyName'] = _companyNameKey.currentState.value;
      params['username'] = _usernameKey.currentState.value;
      params['password'] = _passwordformKey.currentState.value;

      // NetUtils.get("",  (data) async{
      //   Map<String, dynamic> map = json.decode(data);
      //   if (map["success"]) {
      //     setState(() {
      //       animationStatus = 2;
      //     });
      //     await _loginButtonControllerFull.forward();
      //     AppSharedRoutes.sharedInstance().appNavigateTo(context,'/appHomePage/appHomeScreenTwo', AppRouteTransitionType.fadeIn, replace: true);
      //     await DataUtils.saveLoginInfo(map);
      //   } else {
      //     await _loginButtonController.reverse();
      //     showInSnackBar("用户名或密码错误");
      //     setState(() {
      //       animationStatus = 0;
      //     });
      //   }
      // }, params: params,
      //     errorCallback:(exception){
      //       print(exception);
      //     }
      // );

    }
  }
  @override
  Widget build(BuildContext context) {
    timeDilation = 1.0;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return (new WillPopScope(
        onWillPop: _onWillPop,
        child: new Scaffold(
            key: _scaffoldKey,
            body: new Container(
                decoration: new BoxDecoration(
        color: Colors.blueAccent,
                ),
                child: new Container(
          child: new ListView(
        children: <Widget>[
          new Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: 200.0),
                  new Container(
                    margin: new EdgeInsets.symmetric(
                      horizontal: 75.0,
                    ),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(
                            left: 0.0,
                          ),
                          child: _buildLoginForm(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200.0,
                  )
                ],
              ),
              animationStatus == 0
                  ? new Padding(
                      padding: const EdgeInsets.only(
                        bottom: 50.0,
                      ),
                      child: new InkWell(
                          onTap: () {
                            _handleSubmitted(context);
                          },
                          child: new Container(
                            width: 320.0,
                            height: 60.0,
                            alignment: FractionalOffset.center,
                            decoration: new BoxDecoration(
                              color: login_button_color,
                              borderRadius: new BorderRadius.all(
                                  const Radius.circular(30.0)),
                            ),
                            child: new Text(
                              "登录",
                              style: new TextStyle(
                                color: login_word_color,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w200,
                                letterSpacing: 6.0,
                              ),
                            ),
                          )),
                    )
                  : animationStatus == 1
                      ? new StaggerAnimation(
                          buttonController: _loginButtonController.view,
                        )
                      : new StaggerAnimationFull(
                          buttonController:
                              _loginButtonControllerFull.view,
                        )
            ],
          ),
        ],
                ) )),
          )));
  }

  Widget _buildLoginForm() {
    return Form(
        key: _formKey,
        autovalidate: _autovalidate,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                border: new Border(
                  bottom: new BorderSide(
                    width: 0.5,
                    color: Colors.white24,
                  ),
                ),
              ),
              child: new TextFormField(
                key: _companyNameKey,
                initialValue: "JXOPPO",
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                obscureText: false,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "请输入公司名称",
                  hintStyle: _hintTextStyle,
                  contentPadding: _contentPadding,
                ),
                // onSaved: (String value) { loginData.username = value;},
              ),
            ),
            new Container(
              decoration: new BoxDecoration(
                border: new Border(
                  bottom: new BorderSide(
                    width: 0.5,
                    color: Colors.white24,
                  ),
                ),
              ),
              child: new TextFormField(
                key: _usernameKey,
                initialValue: "admin",
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                obscureText: false,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "请输入用户名称",
                  hintStyle: _hintTextStyle,
                  contentPadding: _contentPadding,
                ),
                // onSaved: (String value) { loginData.username = value;},
              ),
            ),
            new Container(
              decoration: new BoxDecoration(
                border: new Border(
                  bottom: new BorderSide(
                    width: 0.5,
                    color: Colors.white24,
                  ),
                ),
              ),
              child: new TextFormField(
                key: _passwordformKey,
                initialValue: "",
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                  border: InputBorder.none,
                  hintText: "请输入密码",
                  hintStyle: _hintTextStyle,
                  contentPadding: _contentPadding,
                ),
                // onSaved: (String value) { loginData.password = value;},
              ),
            ),
          ],
        ));
  }
}
