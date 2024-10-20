import 'package:flutter/material.dart';

class ScreenUtil {
  static final ScreenUtil instance = ScreenUtil();

  int width;
  int height;
  bool allowFontScaling;

  static late MediaQueryData _mediaQueryData;
  static late double _screenWidth;
  static late double _screenHeight;
  static late double _screenHeightNoPadding;
  static late double _pixelRatio;
  static late double _statusBarHeight;
  static late double _bottomBarHeight;
  static late double _textScaleFactor;
  static late Orientation _orientation;

  ScreenUtil({
    this.width = 1080,
    this.height = 1920,
    this.allowFontScaling = false,
  });

  static ScreenUtil getInstance() {
    return instance;
  }

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
    _orientation = mediaQuery.orientation;
    _screenHeightNoPadding =
        mediaQuery.size.height - _statusBarHeight - _bottomBarHeight;
  }

  static MediaQueryData get mediaQueryData => _mediaQueryData;

  static double get textScaleFactory => _textScaleFactor;

  static double get pixelRatio => _pixelRatio;

  static Orientation get orientation => _orientation;

  static double get screenWidth => _screenWidth;

  static double get screenHeight => _screenHeight;

  static double get screenWidthPx => _screenWidth * _pixelRatio;

  static double get screenHeightPx => _screenHeight * _pixelRatio;

  static double get screenHeightNoPadding => _screenHeightNoPadding;

  static double get statusBarHeight => _statusBarHeight * _pixelRatio;

  static double get bottomBarHeight => _bottomBarHeight * _pixelRatio;

  // تعديل لحساب مقياس git check branch-main
  // العرض والارتفاع مع مراعاة AspectRatio
  double get scaleWidth => _screenWidth / instance.width;

  double get scaleHeight => _screenHeight / instance.height;

  double setWidth(int width) => width * scaleWidth;

  double setHeight(int height) => height * scaleHeight;

  double setSp(int fontSize) => allowFontScaling
      ? setWidth(fontSize)
      : setWidth(fontSize) / _textScaleFactor;

  // إضافة دالة لحساب العرض إلى الارتفاع
  double get aspectRatio => _screenWidth / _screenHeight;
}

/*
// مثال على استخدام LayoutBuilder و AspectRatio
class ResponsiveWidget extends StatelessWidget {
  final Widget child;

  const ResponsiveWidget({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // يمكن استخدام constraints للحصول على العرض والارتفاع الفعليين
        double width = constraints.maxWidth;
        double height = constraints.maxHeight;
        double aspectRatio = width / height;

        // تخصيص عنصر بناءً على نسب الشاشة
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(20),
            vertical: ScreenUtil().setHeight(20),
          ),
          child: AspectRatio(
            aspectRatio: aspectRatio,
            child: child,
          ),
        );
      },
    );
  }
}

// Widget اختبار للكود
class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // تهيئة ScreenUtil مع عرض الشاشة وارتفاعها
    ScreenUtil.instance.init(context);

    return Scaffold(
      body: ResponsiveWidget(
        child: Center(
          child: Container(
            width: ScreenUtil().setWidth(200),
            height: ScreenUtil().setHeight(100),
            color: Colors.blue,
            child: Text(
              'Responsive Box',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: TestScreen()));
}*/
