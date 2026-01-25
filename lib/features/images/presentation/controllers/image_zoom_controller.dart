import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ImageZoomController {
  static const double minScale = 1.0;
  static const double maxScale = 6.0;

  final TransformationController tc = TransformationController();

  double get scale => tc.value.getMaxScaleOnAxis();

  void zoomIn() => _setScale(scale * 1.25);
  void zoomOut() => _setScale(scale * 0.8);
  void reset() => _setScale(scale * 1.0);

  void onScroll(PointerScrollEvent e) {
    if (e.scrollDelta.dy < 0) {
      zoomIn();
    } else {
      zoomOut();
    }
  }

  void _setScale(double value) {
    final clamped = value.clamp(minScale, maxScale);

    tc.value = Matrix4.diagonal3Values(clamped, clamped, 1.0);
  }

  void dispose() {
    tc.dispose();
  }
}
