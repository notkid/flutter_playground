import 'package:flutter/material.dart';

const Color _dividLineColor = Color(0xFFDCDDDD);
const Color _transparentUnderlineColor = Colors.transparent;

class ThemeDemo extends StatefulWidget {
  static const String routeName = '/themeDemo';
  @override
  _ThemeDemoState createState() => _ThemeDemoState();
}

class _ThemeDemoState extends State<ThemeDemo>
    with SingleTickerProviderStateMixin {
  PageController _pageController = new PageController();
  double _currentPage = 0.0;
  @override
  void initState() {
    super.initState();
    // _controller = new TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F7F8),
      appBar: AppBar(
        title: Text('注册'),
        elevation: 0.0,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        SizedBox(
          height: 6.8,
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: SizedBox(
            height: 104.1,
            child: FlatButton(
              onPressed: () {
                _pageController.animateToPage(1,
                    curve: Curves.ease, duration: Duration(milliseconds: 300));
              },
              child: Text('下一张'),
            ),
          ),
        ),
        SizedBox(
          height: 6.25,
        ),
        _buildForm(),
      ]),
    );
  }

  Widget _buildForm() {
    return Expanded(
      child: LayoutBuilder(
          builder: (context, constraints) => new NotificationListener(
                onNotification: (ScrollNotification note) {
                  return;
                },
                child: PageView.custom(
                  physics: const PageScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  controller: _pageController,
                  childrenDelegate: new SliverChildBuilderDelegate(
                    (context, index) => _buildChildrenByIndex(index),
                    childCount: 3,
                  ),
                ),
              )),
    );
  }

  Widget _buildChildrenByIndex(index) {
    if (index == 0) {
      return _buildFirstStep();
    } else if (index == 1) {
      return _buildSecStep();
    } else {
      return _buildTrdStep();
    }
  }

  Widget _buildFirstStep() {
    String text = '邀请码';
    String hintText = '请输入邀请码';
    return Column(children: [
      _InputContainer(
        showUnderline: false,
        text: text,
        child: new TextFormField(
          // initialValue: _price,
          autofocus: true,
          style: const TextStyle(
            fontSize: 14.5,
            color: Color(0xFF666666),
          ),
          decoration: _getDecoration(hintText),
          keyboardType: TextInputType.text,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 13.5, left: 13.0),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '注：填写经销商提供的邀请码',
              style: TextStyle(fontSize: 12.5, color: Color(0xFF999999)),
            )),
      ),
      new Padding(
        padding: const EdgeInsets.only(top: 55.7),
        child: new InkWell(
            onTap: (){
              _pageController.animateToPage(1,
                    curve: Curves.ease, duration: Duration(milliseconds: 300));
            },
            child: new Container(
          width: 333.0,
          height: 46.9,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            // color: login_button_color,
            color: Colors.blue,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: new Text(
            "下一步",
            style: new TextStyle(
              // color: login_word_color,
              fontSize: 18.0,
              fontWeight: FontWeight.w200,
              letterSpacing: 6.0,
            ),
          ),
        )),
      ),
    ]);
  }
  Widget _buildSecStep() {
    String text = '手机号';
    String hintText = '请输入邀请码';
    return Column(children: [
      _InputContainer(
        showUnderline: false,
        text: text,
        child: new TextFormField(
          // initialValue: _price,
          autofocus: true,
          style: const TextStyle(
            fontSize: 14.5,
            color: Color(0xFF666666),
          ),
          decoration: _getDecoration(hintText),
          keyboardType: TextInputType.text,
        ),
      ),
      _InputContainer(
        showUnderline: false,
        text: text,
        child: new TextFormField(
          // initialValue: _price,
          autofocus: true,
          style: const TextStyle(
            fontSize: 14.5,
            color: Color(0xFF666666),
          ),
          decoration: _getDecoration(hintText),
          keyboardType: TextInputType.text,
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 13.5, left: 13.0),
      //   child: Align(
      //       alignment: Alignment.centerLeft,
      //       child: Text(
      //         '注：填写经销商提供的邀请码',
      //         style: TextStyle(fontSize: 12.5, color: Color(0xFF999999)),
      //       )),
      // ),
      new Padding(
        padding: const EdgeInsets.only(top: 55.7),
        child: new InkWell(
            onTap: (){
              _pageController.animateToPage(2,
                    curve: Curves.ease, duration: Duration(milliseconds: 300));
            },
            child: new Container(
          width: 333.0,
          height: 46.9,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            // color: login_button_color,
            color: Colors.blue,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: new Text(
            "下一步",
            style: new TextStyle(
              // color: login_word_color,
              fontSize: 18.0,
              fontWeight: FontWeight.w200,
              letterSpacing: 6.0,
            ),
          ),
        )),
      ),
    ]);
  }
  Widget _buildTrdStep() {
    String text = '邀请码';
    String hintText = '请输入邀请码';
    return Column(children: [
      _InputContainer(
        showUnderline: false,
        text: text,
        child: new TextFormField(
          // initialValue: _price,
          autofocus: true,
          style: const TextStyle(
            fontSize: 14.5,
            color: Color(0xFF666666),
          ),
          decoration: _getDecoration(hintText),
          keyboardType: TextInputType.text,
        ),
      ),
      _InputContainer(
        showUnderline: false,
        text: text,
        child: new TextFormField(
          // initialValue: _price,
          autofocus: true,
          style: const TextStyle(
            fontSize: 14.5,
            color: Color(0xFF666666),
          ),
          decoration: _getDecoration(hintText),
          keyboardType: TextInputType.text,
        ),
      ),
      _InputContainer(
        showUnderline: false,
        text: text,
        child: new TextFormField(
          // initialValue: _price,
          autofocus: true,
          style: const TextStyle(
            fontSize: 14.5,
            color: Color(0xFF666666),
          ),
          decoration: _getDecoration(hintText),
          keyboardType: TextInputType.text,
        ),
      ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 13.5, left: 13.0),
      //   child: Align(
      //       alignment: Alignment.centerLeft,
      //       child: Text(
      //         '注：填写经销商提供的邀请码',
      //         style: TextStyle(fontSize: 12.5, color: Color(0xFF999999)),
      //       )),
      // ),
      new Padding(
        padding: const EdgeInsets.only(top: 55.7),
        child: new InkWell(
            // onTap: _handleSubmitted,
            child: new Container(
          width: 333.0,
          height: 46.9,
          alignment: FractionalOffset.center,
          decoration: new BoxDecoration(
            // color: login_button_color,
            color: Colors.blue,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          ),
          child: new Text(
            "确定",
            style: new TextStyle(
              // color: login_word_color,
              fontSize: 18.0,
              fontWeight: FontWeight.w200,
              letterSpacing: 6.0,
            ),
          ),
        )),
      ),
    ]);
  }
}

class _InputContainer extends StatelessWidget {
  _InputContainer({this.text, @required this.child, this.showUnderline = true});
  String text;
  Widget child;
  bool showUnderline;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            width: 1.0,
            color: showUnderline ? _dividLineColor : _transparentUnderlineColor,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 20.0, right: 10.0, bottom: 13.0, left: 6.5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: _getPadding(),
              child: Text(
                text,
                style: TextStyle(
                  letterSpacing: _getLetterSpacing(),
                  // color: kVasFontAccentColor,
                  fontSize: 14.5,
                ),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  _getLetterSpacing() {
    int len = text.length;
    if (len > 3) {
      return 1.0;
    } else if (len > 2) {
      return 3.6;
    }
    return 31.4;
  }

  _getPadding() {
    int len = text.length;
    if (len > 2) {
      return const EdgeInsets.only(
          top: 0.0, right: 12.0, bottom: 0.0, left: 16.0);
    }
    return const EdgeInsets.only(top: 0.0, right: 0.0, bottom: 0.0, left: 0.0);
  }
}

InputDecoration _getDecoration(hintText) {
  return InputDecoration(
    fillColor: Colors.white,
    border: InputBorder.none,
    hintText: hintText,
    hintStyle: TextStyle(
      color: Color(0xFFDADADA),
      fontSize: 14.5,
    ),
    filled: true,
    contentPadding:
        const EdgeInsets.only(top: 0.0, right: 0.0, bottom: 0.0, left: 22.3),
  );
}
