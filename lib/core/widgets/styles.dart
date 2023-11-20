import 'package:google_fonts/google_fonts.dart';

import '../../export_view.dart';

class VStyle {
  static BoxDecoration boxShadow({color = VColor.white, radius = 16.0}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: shadow(),
    );
  }

  static BoxDecoration boxShadowOutline(
      {color = VColor.white, radius = 16.0, borderColor = Colors.grey}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor),
      boxShadow: shadow(),
    );
  }

  static shadow() {
    return const [BoxShadow(blurRadius: 8.0, color: Colors.black12)];
  }

  static BoxDecoration corner({radius = 12.0, color}) {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius), color: color);
  }

  static InputDecoration whiteBoxSearch({
    required String hintText,
    required void Function() onClear,
    double corner = 24.0,
    bool useSuffix = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(0.0),
      hintText: hintText,
      hintStyle: const TextStyle(color: VColor.searchText, fontSize: 14.0),
      prefixIcon: const Icon(Icons.search, color: VColor.searchText),
      filled: true,
      fillColor: VColor.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(corner),
        borderSide: BorderSide.none,
      ),
      suffixIcon: useSuffix
          ? InkWell(
              onTap: onClear,
              child: Container(
                margin: const EdgeInsets.all(12.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: VColor.hint,
                ),
                child: const Icon(
                  Icons.clear,
                  color: VColor.searchText,
                  size: 12.0,
                ),
              ),
            )
          : const SizedBox(),
    );
  }

  static InputDecoration boxSearch({
    required String hintText,
    required void Function() onClear,
    double corner = 12.0,
    bool textNotEmpty = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      fillColor: VColor.textFieldGrey,
      filled: true,
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(
        color: VColor.hint,
        fontSize: 14.0,
      ),
      suffixIcon: Hero(
        tag: 'search',
        child: GestureDetector(
          onTap: () {
            if (textNotEmpty) {
              onClear();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              'assets/svgs/${textNotEmpty ? 'close2' : 'search'}.svg',
              colorFilter:
                  const ColorFilter.mode(VColor.searchText, BlendMode.srcIn),
              width: 24.0,
            ),
          ),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(corner),
        borderSide: const BorderSide(color: VColor.textFieldGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(corner),
        borderSide: const BorderSide(color: VColor.textFieldGrey),
      ),
      labelStyle: GoogleFonts.poppins(color: VColor.dark),
    );
  }

  static InputDecoration blackSearch({
    required String hintText,
    required void Function() onClear,
    bool textNotEmpty = false,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      hintText: hintText,
      hintStyle: GoogleFonts.poppins(
        color: VColor.hint,
        fontSize: 14.0,
      ),
      suffixIcon: Hero(
        tag: 'search',
        child: GestureDetector(
          onTap: () {
            if (textNotEmpty) {
              onClear();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(
              'assets/svgs/${textNotEmpty ? 'close2' : 'search'}.svg',
              colorFilter:
                  const ColorFilter.mode(VColor.searchText, BlendMode.srcIn),
              width: 24.0,
            ),
          ),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      labelStyle: GoogleFonts.poppins(color: VColor.dark),
    );
  }

  static BoxDecoration roundedOutline(
      {color = VColor.textFieldGrey,
      radius = 12.0,
      borderColor = VColor.searchText}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor),
    );
  }

  static InputDecoration fullBorderDecoration() {
    return InputDecoration(
      focusColor: VColor.green,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      alignLabelWithHint: true,
      hintStyle: GoogleFonts.poppins(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      counterStyle: GoogleFonts.poppins(
        color: VColor.hint,
        fontSize: 14.0,
      ),
    );
  }
}
