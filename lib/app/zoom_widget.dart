import 'package:flutter/material.dart';

class ZoomWidget extends StatefulWidget {
  final Widget child;
  const ZoomWidget({Key? key, required this.child}) : super(key: key);

  @override
  State<ZoomWidget> createState() => _ZoomWidgetState();
}

class _ZoomWidgetState extends State<ZoomWidget> {
  final double radius = 48.0;

  bool showZoom = false;
  setShowZoom(bool value) => setState((() => showZoom = value));

  Offset zoomOffset = Offset.zero;
  setZoomOffset(Offset value) => setState((() => zoomOffset = value));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) => setShowZoom(true),
      onLongPressEnd: (details) => setShowZoom(false),
      onLongPressMoveUpdate: (details) {
        setZoomOffset(details.localPosition);
      },
      child: Container(
        height: 400,
        child: Stack(
          children: [
            widget.child,
            if (showZoom)
              Positioned(
                top: zoomOffset.dy - radius,
                left: zoomOffset.dx - radius,
                child: LayoutBuilder(builder: (context, constraints) {
                  return Container(
                    width: radius * 2,
                    height: radius * 2,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.grey)),
                    child: Transform.scale(
                      scale: 1.2,
                      alignment: Alignment.center,
                      child: Container(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight,
                        child: widget.child,
                      ),
                    ),
                  );
                }),
              ),
          ],
        ),
      ),
    );
  }
}
