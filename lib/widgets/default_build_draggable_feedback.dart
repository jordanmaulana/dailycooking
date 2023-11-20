import 'package:flutter/material.dart';

class DefaultBuildDraggableFeedback extends StatelessWidget {
  final BoxConstraints constraints;
  final Widget child;
  const DefaultBuildDraggableFeedback({
    super.key,
    required this.constraints,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.rotationZ(0),
      alignment: FractionalOffset.topLeft,
      child: Material(
        elevation: 6.0,
        color: Colors.transparent,
        borderRadius: BorderRadius.zero,
        child: Card(
          child: ConstrainedBox(
            constraints: constraints,
            child: child,
          ),
        ),
      ),
    );
  }
}
