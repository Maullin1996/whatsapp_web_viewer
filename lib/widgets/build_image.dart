import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'web_image.dart';

Widget buildImage({required String url, double? width, double? height}) {
  if (kIsWeb) {
    return WebImage(url: url, width: width, height: height);
  }

  return Image.network(url, width: width, height: height, fit: BoxFit.cover);
}
