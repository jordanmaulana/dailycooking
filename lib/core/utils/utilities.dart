import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VUtils {
  VUtils._();

  static String addCommaSeparator(String? input) {
    if (input == null) {
      return '';
    }
    final formattedString = input.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match match) => '${match.group(1)},',
    );
    return formattedString;
  }

  static String getPrettyJSONString(jsonObject) {
    if (jsonObject == null) return '';
    try {
      var encoder = const JsonEncoder.withIndent('     ');
      return encoder.convert(jsonObject);
    } catch (e) {
      Get.log(e.toString());
      return '';
    }
  }

  static void hideKeyboard(context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String getFilenameFromUrl(String? url) {
    /// Example: https://cdn.ecosystem-commons.com/media/pitch_zt13goO.pdf

    if (url == null || url.isEmpty) return '';

    /// Get extension
    List<String> extensionList = url.split('.');
    String extension = extensionList.last;

    /// To get pitch_zt13goO.pdf
    List<String> split = url.split('/');

    /// _zt13goO get rid of this because it's from backend
    List<String> fileName = split.last.split('_');
    fileName.removeLast();

    return '${fileName.join(" ")}.$extension';
  }

  static String getOriFileName(String? url) {
    if (url == null || url.isEmpty) return '';
    List<String> split = url.split('/');
    return split[split.length - 1];
  }
}
