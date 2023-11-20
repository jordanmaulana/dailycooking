import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../export_view.dart';

class VText extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final TextAlign? align;
  final bool money;
  final bool number;
  final TextDecoration? decoration;
  final int? maxLines;
  final double? height;
  final Color? color;
  final FontStyle? fontStyle;

  const VText(
    this.title, {
    this.fontSize,
    this.fontWeight,
    this.overflow = TextOverflow.fade,
    this.money = false,
    this.number = false,
    this.decoration,
    this.maxLines,
    this.align,
    this.color = VColor.dark,
    this.fontStyle,
    this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = title ?? '';
    if (number) text = VUtils.addCommaSeparator(title);
    if (money) text = 'Rp. ${VUtils.addCommaSeparator(title)}';
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        fontStyle: fontStyle,
        height: height,
      ),
      overflow: overflow,
      textAlign: align,
      maxLines: maxLines,
    );
  }
}

class TitleText extends StatelessWidget {
  final String? text;
  final TextAlign? align;

  const TitleText(this.text, {this.align, super.key});

  @override
  Widget build(BuildContext context) {
    return VText(
      text,
      color: VColor.white,
      align: align,
    );
  }
}

class AppBarText extends StatelessWidget {
  final String title;
  final Color color;

  const AppBarText(this.title, {this.color = VColor.white, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VText(
      title,
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
    );
  }
}

class LabelText extends StatelessWidget {
  final String? text;

  const LabelText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: VStyle.corner(color: VColor.dark),
      child: VText(
        text,
        color: VColor.white,
        fontSize: 12.0,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class VersionText extends StatefulWidget {
  final bool onlyVersion;

  const VersionText({this.onlyVersion = false, Key? key}) : super(key: key);

  @override
  State<VersionText> createState() => _VersionTextState();
}

class _VersionTextState extends State<VersionText> {
  PackageInfo? info;

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String version = 'Versi ${info?.version ?? ''}';
    return VText(
      version,
      align: TextAlign.center,
    );
  }

  getInfo() async {
    info = await PackageInfo.fromPlatform();
    setState(() {});
  }
}
