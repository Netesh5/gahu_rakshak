import 'package:flutter/material.dart';
import 'package:gahurakshak/core/theme/app_text_theme.dart';

Widget buildParagraph(String text, AppTextTheme style) {
  List<String> paragraphs = text.split('\n');

  return RichText(
    text: TextSpan(
      children: paragraphs.map(
        (paragraph) {
          int colonIndex = paragraph.indexOf(':');
          String title = paragraph.substring(0, colonIndex + 1);
          String description = paragraph.substring(colonIndex + 1).trim();

          return TextSpan(children: [
            TextSpan(
              text: title,
              style:
                  style.bodyLargeSemiBold.copyWith(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: "$description\n\n",
              style: style.bodyLargeRegular,
            ),
          ]);
        },
      ).toList(),
    ),
  );
}
