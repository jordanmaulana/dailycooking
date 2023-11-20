import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import 'styles.dart';
import 'texts.dart';

class VFormInput extends StatelessWidget {
  final String? label;
  final String? hint;
  final double radius;
  final bool obscure;
  final Color? fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool enabled;
  final void Function(String?)? onChanged;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Color? borderColor;
  final void Function(String?)? onSubmit;
  final void Function()? onTap;
  final bool autoFocus;
  final Iterable<String>? autoFill;
  final int? maxLength;
  final bool isDense;
  final FocusNode? focusNode;
  final String? initialValue;

  const VFormInput({
    this.label,
    this.hint,
    this.radius = 8.0,
    this.obscure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onSaved,
    this.fillColor = VColor.white,
    this.controller,
    this.enabled = true,
    this.onChanged,
    this.maxLines,
    this.keyboardType,
    this.borderColor = VColor.textFieldGrey,
    this.onSubmit,
    this.onTap,
    this.textCapitalization = TextCapitalization.sentences,
    this.autoFocus = false,
    this.maxLength,
    this.autoFill,
    this.focusNode,
    this.isDense = true,
    this.initialValue,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      autofillHints: autoFill,
      maxLength: maxLength,
      autofocus: autoFocus,
      onTap: onTap,
      style: GoogleFonts.poppins(),
      enabled: enabled,
      controller: controller,
      obscureText: obscure,
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      maxLines: obscure ? 1 : maxLines,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onSubmit,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hint,
        focusColor: VColor.green,
        alignLabelWithHint: true,
        fillColor: fillColor,
        filled: fillColor != null,
        isDense: isDense,
        hintStyle: GoogleFonts.poppins(),
        focusedBorder: _border(color: VColor.green, radius: radius),
        enabledBorder:
            _border(color: borderColor ?? VColor.border, radius: radius),
        errorBorder: _border(color: Colors.red, radius: radius),
        disabledBorder: _border(color: VColor.border, radius: radius),
        focusedErrorBorder: _border(color: VColor.green, radius: radius),
        counterStyle: GoogleFonts.poppins(
          color: VColor.hint,
          fontSize: 14.0,
        ),
      ),
      inputFormatters: keyboardType == TextInputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : null,
    );
  }

  _border({required Color color, required double radius}) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: color),
      borderRadius: BorderRadius.circular(radius),
    );
  }
}

class VDropdown<T> extends StatelessWidget {
  const VDropdown({
    Key? key,
    required this.dropdownItems,
    required this.onChanged,
    required this.dropDownValue,
    this.label,
    this.focusNode,
    this.hint,
    this.validator,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);

  final List<DropdownMenuItem<T>> dropdownItems;
  final void Function(T) onChanged;
  final T? dropDownValue;
  final String? hint;
  final String? label;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      alignment: Alignment.center,
      child: DropdownButtonFormField(
        focusNode: focusNode,
        isExpanded: true,
        hint: VText(hint, overflow: TextOverflow.ellipsis, color: VColor.hint),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
            fillColor: fillColor,
            filled: fillColor != null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor ?? VColor.border),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor ?? VColor.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: VColor.primaryButton),
            )),
        items: dropdownItems,
        value: dropDownValue,
        icon: const Icon(Icons.arrow_drop_down),
        onChanged: <T>(value) => onChanged(value),
        dropdownColor: fillColor,
        isDense: false,
      ),
    );
  }
}

class FullBorderTextField extends StatelessWidget {
  final int? minLines;
  final TextEditingController? controller;
  const FullBorderTextField({this.controller, this.minLines, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: VStyle.fullBorderDecoration(),
      maxLines: null,
      minLines: minLines,
      controller: controller,
      style: GoogleFonts.poppins(),
      textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.text,
    );
  }
}
