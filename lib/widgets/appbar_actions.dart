import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarAction extends StatelessWidget {
  final String icon;
  final Function() onTap;
  const AppBarAction({required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          'assets/svgs/$icon.svg',
          width: 24.0,
        ),
      ),
    );
  }
}

class EditAction extends StatelessWidget {
  final Function() onTap;
  const EditAction({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarAction(
      icon: 'edit',
      onTap: onTap,
    );
  }
}

class DeleteAction extends StatelessWidget {
  final Function() onTap;
  const DeleteAction({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBarAction(
      icon: 'delete',
      onTap: onTap,
    );
  }
}
