import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core/utils/colors.dart';
import '../core/widgets/buttons.dart';
import '../core/widgets/styles.dart';
import '../core/widgets/texts.dart';

class BlackButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final double? width;
  final Color textColor;
  final double? textSize;
  final bool enabled;

  const BlackButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.width,
    this.textColor = VColor.green,
    this.textSize,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      label,
      textColor: textColor,
      boxColor: VColor.dark,
      outlineColor: VColor.dark,
      onTap: onTap,
      width: width,
      textSize: textSize,
      enabled: enabled,
    );
  }
}

class WhiteButon extends StatelessWidget {
  final String label;
  final double? textSize;

  final Function() onTap;

  const WhiteButon({
    Key? key,
    required this.label,
    required this.onTap,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VButton(
      label,
      textColor: VColor.dark,
      boxColor: VColor.white,
      outlineColor: VColor.white,
      onTap: onTap,
      textSize: textSize,
    );
  }
}

class VBackButton extends StatelessWidget {
  const VBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 12.0, 16.0, 16.0),
        child: SvgPicture.asset('assets/svgs/back.svg'),
      ),
    );
  }
}

class BackButtonForAppBar extends StatelessWidget {
  const BackButtonForAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SvgPicture.asset('assets/svgs/back.svg'),
      ),
    );
  }
}

class VBackButtonWithinAppbar extends StatelessWidget {
  const VBackButtonWithinAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.back(),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SvgPicture.asset('assets/svgs/back.svg'),
      ),
    );
  }
}

class WhiteUploadButton extends StatelessWidget {
  final Function() onTap;

  const WhiteUploadButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: VStyle.roundedOutline(
          color: VColor.white,
          radius: 32.0,
          borderColor: VColor.green,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/svgs/upload.svg',
              colorFilter:
                  const ColorFilter.mode(VColor.green, BlendMode.srcIn),
            ),
            const VText(
              '  Upload',
              color: VColor.green,
            ),
          ],
        ),
      ),
    );
  }
}
