import 'package:flutter/material.dart';

class HeroWrapper extends StatelessWidget {
  final String tag;
  final Widget child;
  const HeroWrapper({required this.tag, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(child: child),
    );
  }
}
