import 'package:flutter/material.dart';

class AppRichText extends StatelessWidget {
  const AppRichText({
    Key? key,
    required this.title,
    required this.value,
    this.fontSize = 14.0,
    this.keyFontSize = 14.0,
    this.valueFontSize = 14.0,
    this.titleColor,
    this.valueColor = Colors.black,
  }) : super(key: key);
  final String title;
  final String value;
  final double? fontSize, keyFontSize, valueFontSize;
  final Color? titleColor, valueColor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(
          color: titleColor ?? Theme.of(context).primaryColor,
          fontFamily: 'din',
          fontSize: keyFontSize ?? fontSize,
        ),
        children: [
          TextSpan(
            text: value,
            style: TextStyle(
              color: valueColor,
              fontSize: valueFontSize ?? fontSize,
              fontFamily: 'din',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
