import '../export_view.dart';

class StandardAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? appBar;
  final Widget? leading;
  final bool? centerTitle;
  const StandardAppbar(this.title,
      {this.actions, this.appBar, this.leading, Key? key, this.centerTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          appBar ?? Hero(tag: title, child: Material(child: TitleText(title))),
      backgroundColor: VColor.white,
      elevation: 0.0,
      actions: actions,
      leading: leading,
      centerTitle: centerTitle ?? false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;

  const BackAppBar({this.actions, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: actions,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: InkWell(
          onTap: () => Get.back(),
          child: SvgPicture.asset('assets/svgs/back.svg'),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
