import 'package:flutter/material.dart';
import 'package:flutter_playground/demo/stepper_demo.dart';
import '../demo/all.dart';

class GalleryDemoCategory {
  const GalleryDemoCategory._({ this.name, this.icon });
  @required final String name;
  @required final Icon icon;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other))
      return true;
    if (runtimeType != other.runtimeType)
      return false;
    final GalleryDemoCategory typedOther = other;
    return typedOther.name == name && typedOther.icon == icon;
  }

  @override
  int get hashCode => hashValues(name, icon);

  @override
  String toString() {
    return '$runtimeType($name)';
  }
}

const GalleryDemoCategory _kSliver = const GalleryDemoCategory._(
  name: 'Sliver',
  icon: Icon(Icons.face)
);

const GalleryDemoCategory _kTheme = const GalleryDemoCategory._(
  name: 'Theme',
  icon: Icon(Icons.face)
);

class GalleryDemo {
  const GalleryDemo({
    @required this.title,
    @required this.icon,
    this.subtitle,
    @required this.category,
    @required this.routeName,
    @required this.buildRoute,
  }) : assert(title != null),
       assert(category != null),
       assert(routeName != null),
       assert(buildRoute != null);

  final String title;
  final Icon icon;
  final String subtitle;
  final GalleryDemoCategory category;
  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}
List<GalleryDemo> _buildGalleryDemos() {
  final List<GalleryDemo> galleryDemos = <GalleryDemo>[
    GalleryDemo(
      title: 'persistentSliver',
      subtitle: 'basic usage of persistent sliver',
      icon: Icon(Icons.explore),
      category: _kSliver,
      routeName: PersistentSliverDemo.routeName,
      buildRoute: (BuildContext context) => new PersistentSliverDemo()
    ),
    GalleryDemo(
      title: 'themeDemo',
      subtitle: 'basic usage of theme',
      icon: Icon(Icons.explore),
      category: _kTheme,
      routeName: ThemeDemo.routeName,
      buildRoute: (BuildContext context) => new ThemeDemo()
    ),
    GalleryDemo(
      title: 'stepper',
      subtitle: 'basic usage of theme',
      icon: Icon(Icons.explore),
      category: _kTheme,
      routeName: StepperDemo.routeName,
      buildRoute: (BuildContext context) => new StepperDemo()
    ),
    GalleryDemo(
      title: 'stepper',
      subtitle: 'basic usage of theme',
      icon: Icon(Icons.explore),
      category: _kTheme,
      routeName: AnimatedListSample.routeName,
      buildRoute: (BuildContext context) => new AnimatedListSample()
    ),
    GalleryDemo(
      title: 'heroDemo',
      subtitle: 'basic usage of hero',
      icon: Icon(Icons.explore),
      category: _kTheme,
      routeName: HeroDemo.routeName,
      buildRoute: (BuildContext context) => new HeroDemo()
    ),
    GalleryDemo(
      title: 'loginAnimation',
      subtitle: 'basic usage of hero',
      icon: Icon(Icons.explore),
      category: _kTheme,
      routeName: LoginScreen.routeName,
      buildRoute: (BuildContext context) => new LoginScreen()
    ),
    GalleryDemo(
      title: 'TransformDemo',
      subtitle: 'basic usage of hero',
      icon: Icon(Icons.explore),
      category: _kTheme,
      routeName: TransformDemo.routeName,
      buildRoute: (BuildContext context) => new TransformDemo()
    ),
    GalleryDemo(
      title: 'SegmentDemo',
      subtitle: 'basic usage of hero',
      icon: Icon(Icons.explore),
      category: _kTheme,
      routeName: SegmentDemo.routeName,
      buildRoute: (BuildContext context) => new SegmentDemo()
    ),
  ];
  return galleryDemos;
}

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();