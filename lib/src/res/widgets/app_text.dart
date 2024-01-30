import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final double? height;
  final FontWeight? weight;
  final int? maxLines;
  final String? family;
  final Color? backgroundColor;
  final TextAlign? align;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final double? wordSpacing;
  final bool? softWrap;
  final double? letterSpacing;
  final TextBaseline? textBaseline;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  const AppText(
    this.text, {
    Key? key,
    this.color,
    this.wordSpacing,
    this.family,
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
    this.onTap,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Text(
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
            fontFamily: family,
            fontStyle: fontStyle,
            overflow: overflow,
            letterSpacing: letterSpacing,
            textBaseline: textBaseline,
          ),
        ),
      ),
    );
  }
}
