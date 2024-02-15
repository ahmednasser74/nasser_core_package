import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nasser_core_package/nasser_ui_package.dart';

class AppSegmentSelection<T> extends StatefulWidget {
  AppSegmentSelection({
    Key? key,
    this.label,
    required this.groupValue,
    required this.children,
    required this.onValueChanged,
    this.title,
  }) : super(key: key);

  T groupValue;
  final Map<T, Widget> children;
  final String? title;
  final ValueChanged<T?> onValueChanged;
  final String? label;

  @override
  State<AppSegmentSelection<T>> createState() => _AppSegmentSelectionState<T>();
}

class _AppSegmentSelectionState<T> extends State<AppSegmentSelection<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        if (widget.label != null) AppText(widget.label!),
        if (widget.label != null) 6.heightBox,
        CupertinoSlidingSegmentedControl<T>(
          backgroundColor: Colors.green,
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
          thumbColor: Colors.white,
          groupValue: widget.groupValue,
          onValueChanged: (T? value) {
            widget.onValueChanged(value);
            setState(() => widget.groupValue = value as T);
          },
          children: widget.children,
        ),
      ],
    );
  }
}
