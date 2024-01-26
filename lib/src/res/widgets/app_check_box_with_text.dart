import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppCheckboxWithTextWidget extends StatefulWidget {
  AppCheckboxWithTextWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.title,
    this.onTapText,
  }) : super(key: key);

  final Function(bool) onChanged;
  bool value;
  final String title;
  final VoidCallback? onTapText;

  @override
  State<AppCheckboxWithTextWidget> createState() => _AppCheckboxWithTextWidgetState();
}

class _AppCheckboxWithTextWidgetState extends State<AppCheckboxWithTextWidget> {
  @override
  Widget build(BuildContext context) {
    // this for removing changeable status onTap from text in case need to tap on text
    if (widget.onTapText == null) {
      return InkWell(
        onTap: () {
          widget.value = !widget.value;
          widget.onChanged(widget.value);
          setState(() {});
        },
        child: _checkBox(),
      );
    }
    return _checkBox();
  }

  Widget _checkBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30,
          child: Checkbox(
            value: widget.value,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (newValue) {
              widget.value = !widget.value;
              widget.onChanged(widget.value);
              setState(() {});
            },
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: widget.onTapText,
            child: Text(widget.title),
          ),
        ),
      ],
    );
  }
}
