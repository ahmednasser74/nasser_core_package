import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title, fontFamily;
  final Alignment alignment;
  final double elevation, fonSize, paddingHorizontal, paddingVertical, marginHorizontal, marginVertical;
  final double? borderRadius;
  final FontWeight? fontWeight;
  final Widget? child;
  final Color textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final Size? minimumSize;
  final TextAlign? textAlign;
  const AppButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.alignment = Alignment.center,
    this.backgroundColor,
    this.elevation = 0,
    this.child,
    this.paddingHorizontal = 20,
    this.paddingVertical = 10,
    this.marginHorizontal = 0,
    this.marginVertical = 0,
    this.textColor = Colors.white,
    this.fonSize = 20,
    this.fontFamily = 'din',
    this.borderColor,
    this.borderRadius,
    this.fontWeight,
    this.minimumSize,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: marginHorizontal,
        vertical: marginVertical,
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal,
            vertical: paddingVertical,
          ),
          minimumSize: minimumSize,
          side: BorderSide(color: borderColor ?? Colors.transparent),
          backgroundColor: backgroundColor ?? Theme.of(context).primaryColor,
          elevation: elevation,
          alignment: alignment,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10.r)),
          ),
        ),
        child: child ??
            Text(
              title ?? '',
              style: TextStyle(
                fontSize: fonSize,
                color: textColor,
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                height: 1.2,
              ),
              textAlign: textAlign,
            ),
      ),
    );
  }
}
