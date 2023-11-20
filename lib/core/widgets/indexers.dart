import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CarouselIndex extends StatelessWidget {
  final int active, index;

  const CarouselIndex(this.active, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool active = this.active == index;
    return AnimatedContainer(
      width: active ? 20.0 : 5.0,
      height: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 3.0),
      decoration: BoxDecoration(
        // border: Border.all(color: VColor.bottomGrey, width: 0.4),
        borderRadius: BorderRadius.circular(14),
        color: active ? VColor.green : VColor.textFieldGrey,
      ),
      duration: const Duration(milliseconds: 200),
    );
  }
}
