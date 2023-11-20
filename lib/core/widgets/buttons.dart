import 'package:flutter/material.dart';

import '../utils/colors.dart';
import 'styles.dart';
import 'texts.dart';

class VButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String label;
  final Color? textColor;
  final Color outlineColor;
  final Color boxColor;
  final bool enabled;
  final double? textSize;
  final Function() onTap;

  const VButton(
    this.label, {
    this.width,
    this.height,
    this.textColor,
    this.enabled = true,
    this.outlineColor = VColor.blue,
    this.boxColor = VColor.blue,
    this.textSize,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 49.0,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(color: enabled ? outlineColor : boxColor),
          color: enabled ? boxColor : VColor.searchText,
          boxShadow: VStyle.shadow(),
        ),
        alignment: Alignment.center,
        child: VText(
          label,
          fontSize: textSize,
          color: textColor ?? VColor.white,
          align: TextAlign.center,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}

class RedButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final bool enabled;
  final double? width;
  final double? textSize;

  const RedButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.enabled = true,
    this.width,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      label,
      width: width,
      textSize: textSize,
      boxColor: enabled ? VColor.red : VColor.searchText,
      outlineColor: enabled ? VColor.red : VColor.searchText,
      onTap: () {
        if (enabled) onTap();
      },
      enabled: enabled,
    );
  }
}

class TransparentButton extends StatefulWidget {
  final String label;
  final Function onPressed;
  final Color backgroundColor;
  final Color textColor;

  const TransparentButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  TransparentButtonState createState() => TransparentButtonState();
}

class TransparentButtonState extends State<TransparentButton> {
  Color? _buttonColor;
  Color? _textColor;
  FontWeight _fontWeight = FontWeight.normal;

  @override
  void initState() {
    super.initState();
    _buttonColor = widget.backgroundColor;
    _textColor = widget.textColor;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _buttonColor = VColor.textFieldGrey;
          _textColor = VColor.green;
          _fontWeight = FontWeight.w600;
        });
      },
      onTapUp: (_) {
        setState(() {
          _buttonColor = widget.backgroundColor;
          _textColor = widget.textColor;
          _fontWeight = FontWeight.normal;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _buttonColor = widget.backgroundColor;
          _textColor = widget.textColor;
          _fontWeight = FontWeight.normal;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _buttonColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: VText(
            widget.label,
            fontSize: 16.0,
            fontWeight: _fontWeight,
            color: _textColor,
          ),
        ),
      ),
    );
  }
}
