import 'package:care_paws/modules/community/uploads/story_upload/modules/draw_module/draw_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawingToolbarWidget extends StatelessWidget {
  const DrawingToolbarWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = context.watch<DrawingController>();

    return Container(
      color: Colors.black54,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// 🎨 COLORS
          Row(
            children: [
              _colorDot(context, Colors.red),
              _colorDot(context, Colors.blue),
              _colorDot(context, Colors.green),
              _colorDot(context, Colors.yellow),
              _colorDot(context, Colors.white),
            ],
          ),

          /// 🖌 SIZE
          Expanded(
            child: Slider(
              value: controller.strokeWidth,
              min: 2,
              max: 12,
              onChanged: controller.changeStroke,
            ),
          ),

          /// 🔁 ACTIONS
          Row(
            children: [

              IconButton(
                onPressed: controller.undo,
                icon: const Icon(Icons.undo, color: Colors.white),
              ),

              IconButton(
                onPressed: controller.clear,
                icon: const Icon(Icons.delete, color: Colors.white),
              ),

            ],
          )

        ],
      ),
    );
  }

  Widget _colorDot(BuildContext context, Color color) {
    return GestureDetector(
      onTap: () => context.read<DrawingController>().changeColor(color),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}