import 'package:care_paws/modules/community/uploads/story_upload/modules/draw_module/draw_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawingCanvasWidget extends StatelessWidget {
  const DrawingCanvasWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<DrawingController>();

    return GestureDetector(

      onPanUpdate: (details) {
        controller.addPoint(details.localPosition);
      },

      onPanEnd: (_) {
        controller.endLine();
      },

      child: CustomPaint(
        size: Size.infinite,
        painter: _DrawingPainter(
          controller.points,
          controller.selectedColor,
          controller.strokeWidth,
        ),
      ),
    );
  }
}

class _DrawingPainter extends CustomPainter {

  final List<Offset?> points;
  final Color color;
  final double strokeWidth;

  _DrawingPainter(this.points, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}