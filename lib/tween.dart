import 'dart:ui';

import 'package:flutter/widgets.dart';

//I think this is the code that actually does the movement?
//I should watch the video
//Currently can't test the code bcos my phone is not found on my mac
//Patrick still gay
class CustomRectTween extends RectTween {
  CustomRectTween({
    @required Rect begin,
    @required Rect end,
  }) : super(begin: begin, end: end);

  @override
  Rect lerp(double t) {
    final elasticCurveValue = Curves.easeOut.transform(t);
    return Rect.fromLTRB(
      lerpDouble(begin.left, end.left, elasticCurveValue),
      lerpDouble(begin.top, end.top, elasticCurveValue),
      lerpDouble(begin.right, end.right, elasticCurveValue),
      lerpDouble(begin.bottom, end.bottom, elasticCurveValue),
    );
  }
}
