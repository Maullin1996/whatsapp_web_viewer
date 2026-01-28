import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_monitor_viewer/features/images/presentation/controllers/image_zoom_controller.dart';
import 'package:whatsapp_monitor_viewer/features/messages/domain/entities/image_view_item.dart';
import 'package:whatsapp_monitor_viewer/features/messages/presentation/widgets/nav_button.dart';

class ImageDetailPage extends StatefulWidget {
  final int initialIndex;
  final List<ImageViewItem> items;

  const ImageDetailPage({
    super.key,
    required this.initialIndex,
    required this.items,
  });

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  late final PageController _controller;
  late final ImageZoomController _zoom;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    _controller = PageController(initialPage: _index);
    _zoom = ImageZoomController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _zoom.dispose();
    super.dispose();
  }

  void _goNext() {
    if (_index < widget.items.length + 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  void _goPrev() {
    if (_index > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// ---------- IMAGE ----------
          Positioned.fill(
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.items.length,
              onPageChanged: (value) => setState(() => _index = value),
              itemBuilder: (_, index) {
                final item = widget.items[index];
                return Center(
                  child: Listener(
                    onPointerSignal: (event) {
                      if (event is PointerScrollEvent) {
                        _zoom.onScroll(event);
                      }
                    },
                    child: InteractiveViewer(
                      transformationController: _zoom.tc,
                      minScale: ImageZoomController.minScale,
                      maxScale: ImageZoomController.maxScale,
                      panEnabled: _zoom.scale > 1.0,
                      scaleEnabled: false,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 80),
                        child: Image.network(
                          cacheWidth: 1600,
                          cacheHeight: 1600,
                          item.url,
                          fit: BoxFit.contain,
                          webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              height: 200,
                              color: Colors.black12,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorBuilder: (_, _, _) => Container(
                            height: 200,
                            color: Colors.black12,
                            child: const Center(
                              child: Icon(Icons.broken_image),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          /// ---------- ZOOM ----------
          Positioned(
            top: 16,
            right: 64,
            child: Row(
              children: [
                IconButton(
                  tooltip: 'Zoom -',
                  onPressed: _zoom.zoomOut,
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  tooltip: 'Reset',
                  onPressed: _zoom.reset,
                  icon: const Icon(Icons.refresh),
                ),
                IconButton(
                  tooltip: 'Zoom +',
                  onPressed: _zoom.zoomIn,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),

          /// ---------- CLOSE ----------
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              tooltip: 'Cerrar',
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close, size: 28),
            ),
          ),

          /// ---------- NAV LEFT ----------
          if (_index > 0)
            Positioned(
              left: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: NavButton(icon: Icons.chevron_left, onTap: _goPrev),
              ),
            ),

          /// ---------- NAV RIGHT ----------
          if (_index < widget.items.length - 1)
            Positioned(
              right: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: NavButton(icon: Icons.chevron_right, onTap: _goNext),
              ),
            ),
        ],
      ),
    );
  }
}
