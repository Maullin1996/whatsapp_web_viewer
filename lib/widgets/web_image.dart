// lib/widgets/web_image.dart
import 'dart:ui' as ui; // ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class WebImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;

  const WebImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      throw UnsupportedError('WebImage solo funciona en Web');
    }

    final viewType = 'web-img-${url.hashCode}';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
      final img = html.ImageElement()
        ..src = url
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.objectFit = fit.name
        ..style.border = 'none';

      return img;
    });

    return SizedBox(
      width: width,
      height: height,
      child: HtmlElementView(viewType: viewType),
    );
  }
}
