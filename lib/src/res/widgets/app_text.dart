import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final double? height;
  final FontWeight? weight;
  final int? maxLines;
  final String? fontFamily;
  final Color? backgroundColor;
  final TextAlign? align;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final double? wordSpacing;
  final bool? softWrap;
  final double? letterSpacing;
  final TextBaseline? textBaseline;

  const AppText(
    this.text, {
    Key? key,
    this.color,
    this.wordSpacing,
    this.fontFamily,
    this.size,
    this.weight,
    this.align,
    this.decoration,
    this.backgroundColor,
    this.height,
    this.fontStyle,
    this.maxLines,
    this.overflow,
    this.softWrap,
    this.letterSpacing,
    this.textBaseline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        decoration: decoration,
        backgroundColor: backgroundColor,
        height: height,
        wordSpacing: wordSpacing,
        fontFamily: fontFamily,
        fontStyle: fontStyle,
        overflow: overflow,
        letterSpacing: letterSpacing,
        textBaseline: textBaseline,
      ),
    );
  }
}
