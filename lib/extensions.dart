import 'package:flutter/cupertino.dart';

extension ScreenSizes on BuildContext{
  double get width{
    return MediaQuery.of(this).size.width;
  }

  double get height{
    return MediaQuery.of(this).size.height;
  }
}