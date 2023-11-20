import 'package:flutter/material.dart';

class VColor {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  VColor._();

  // core color
  static const Color scaffoldBg = Color(0xfff6f8fa);
  static const Color textFieldGrey = Color(0xffEDEDED);
  static const Color red = Color(0xffBD0017);
  static const Color primaryButton = Colors.orange;
  static const Color secondaryButton = Color(0xff0a2342);
  static const Color searchText = Color(0xff50566A);
  static const Color white = Color(0xfffafafa);
  static const Color grey = Color(0xffBFBFBF);
  static const Color dark = Color(0xff3C3C3C);
  static const Color border = Color(0xffE0E0E0);
  static const Color bottomGrey = Color(0xffD1D1D6);
  static const Color hint = Color(0xffBFBFBF);

  // custom color
  static const Color green = Color(0xff7BE504);
  static Color transparentGreen = const Color(0xff73C518).withOpacity(0.75);
  static Color transparentGray = const Color(0xff3B3B3B).withOpacity(0.8);
  static const Color textGrey = Color(0xff828282);
  static const Color fundingColor = Color(0xff989898);
  static const Color bioFieldGrey = Color(0xffF8F8F8);
  static const Color yellow = Color(0xffF9BF24);
  static const Color darkYellow = Color(0xffBD8F12);
  static const Color orange = Colors.orange;
  static const Color whatsapp = Color(0xff128C7E);
  static const Color websiteLink = Color(0xff0000EE);
  static const Color blue = Colors.blue;

  static LinearGradient buttonGradient() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      transform: GradientRotation(-0.1745329),

      ///10 degree
      colors: [
        Color(0xff7BE504),
        Color(0xffF9BF24),
      ],
    );
  }

  static LinearGradient tagGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,

      ///10 degree
      colors: [
        Colors.white.withOpacity(0.36),
        Colors.white,
      ],
    );
  }

  static LinearGradient pitchGradient() {
    return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,

      ///10 degree
      colors: [
        Colors.white,
        Colors.white.withOpacity(0.85),
      ],
    );
  }

  static LinearGradient cardShadow() {
    return const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.black54, Colors.transparent, Colors.transparent],
    );
  }

  static Color colorFromString(String? color) {
    if (color == null) return VColor.white;
    return Color(int.parse(color.replaceAll('#', '0xff')));
  }

  static ColorFilter filter(Color color) {
    return ColorFilter.mode(color, BlendMode.srcIn);
  }
}
