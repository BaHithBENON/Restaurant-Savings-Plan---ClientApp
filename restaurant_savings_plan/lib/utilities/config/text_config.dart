import 'package:flutter/material.dart';

import '../variables/fonts_names.dart';

class TextConfig {
  static TextStyle getSimpleTextStyle(
    bool bold, {
    Color? color,
    int? size,
    String? font = FontsNames.fontMono,
    bool underline = false,
    bool italic = false,
    double? letterSpacing,
    double? wordSpacing,
  }) {
    return TextStyle(
      fontFamily: font,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: size != null ? (size == 3 ? 10 : size.toDouble()) : null,
      color: color,
      fontStyle: italic ? FontStyle.italic : null,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
    );
  }

  static RegExp regExpForRemoveHTMLTags = RegExp(r"<[^>]*>");
  static RegExp nbsp = RegExp(r"&nbsp;");

  static String textWorker(String str) {
    String option1 = str.replaceAll(TextConfig.regExpForRemoveHTMLTags, "");
    String option2 = option1.replaceAll(TextConfig.nbsp, " ");
    return option2;
  }
}
