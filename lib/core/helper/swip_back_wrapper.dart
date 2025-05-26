import 'package:flutter/material.dart';

class SwipeBackWrapper extends StatelessWidget {
  final Widget child;
  final double triggerEdge;
  final VoidCallback? onSwipeBack;

  const SwipeBackWrapper({
    super.key,
    required this.child,
    this.triggerEdge = 20.0,
    this.onSwipeBack,
  });

  @override
  Widget build(BuildContext context) {
    double dragStartX = 0.0;

    return GestureDetector(
      onHorizontalDragStart: (details) {
        dragStartX = details.globalPosition.dx;
      },
      onHorizontalDragEnd: (details) {
        // لو السحب ابتدا من الطرف اللي احنا محددينه
        if (dragStartX < triggerEdge &&
            details.primaryVelocity != null &&
            details.primaryVelocity! > 0) {
          // primaryVelocity > 0 معناها سحب لليمين
          if (onSwipeBack != null) {
            onSwipeBack!();
          } else {
            Navigator.of(context).pop();
          }
        }
      },
      child: child,
    );
  }
}
