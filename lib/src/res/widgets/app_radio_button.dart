import 'package:flutter/material.dart';
import 'package:nasser_core_package/nasser_core_package.dart';

class AppRadioButton<T> extends StatelessWidget {
  final String label;
  final T groupValue;
  final T value;
  final Function(T) onChanged;
  final double? labelFontSize;

  const AppRadioButton({
    super.key,
    required this.label,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    this.labelFontSize,
  });

  @override
  Widget build(BuildContext context) {
    final radioTheme = Theme.of(context).radioTheme;
    return InkWell(
      onTap: value != groupValue ? () => onChanged(value) : null,
      child: Container(
        width: 1.sw,
        height: 0.05.sh,
        padding: EdgeInsets.symmetric(horizontal: 0.02.sw),
        // decoration: value == groupValue
        //     ? BoxDecoration(
        //         color: AppPalette.accentColor.withOpacity(0.2),
        //         borderRadius: BorderRadius.all(Radius.circular(8.r)),
        //       )
        //     : BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: AppCorners.lgBorder,
        //         border: Border.all(width: 2, color: AppPalette.grey200),
        //       ),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 20.h,
              width: 20.w,
              child: Radio<T>(
                groupValue: groupValue,
                value: value,
                overlayColor: radioTheme.fillColor,
                onChanged: (T? newValue) => onChanged(newValue as T),
              ),
            ),
            8.widthBox,
            AppText(
              label,
              maxLines: 1,
              size: labelFontSize,
            ),
          ],
        ),
      ),
    );
  }
}
