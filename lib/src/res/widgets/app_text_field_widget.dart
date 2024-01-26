import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? hint;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String? v)? validator;
  final String? labelText;
  final AutovalidateMode? autovalidateMode;
  final bool readOnly;
  final void Function(String? v)? onChanged;
  final bool dispose;
  final bool acceptArabicCharOnly;
  final bool acceptNumbersOnly;
  final VoidCallback? onTap;
  final int? maxLines;
  final Color? fontColor;
  final double? fontSize;
  final double? height;
  final FocusNode? focusNode;
  final bool autoFocus;
  final EdgeInsets? padding;

  const AppTextFieldWidget({
    Key? key,
    this.controller,
    this.inputType,
    this.prefixIcon,
    this.hint,
    this.obscureText = false,
    this.readOnly = false,
    this.acceptArabicCharOnly = false,
    this.acceptNumbersOnly = false,
    this.dispose = true,
    this.suffixIcon,
    this.validator,
    this.labelText,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.fontColor = Colors.black,
    this.fontSize,
    this.height,
    this.focusNode,
    this.padding,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  State<AppTextFieldWidget> createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextFieldWidget> {
  late bool passwordVisibility;

  @override
  void initState() {
    super.initState();
    passwordVisibility = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        height: widget.height,
        margin: widget.padding,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(120.r)),
        child: TextFormField(
          style: TextStyle(color: widget.fontColor, fontSize: widget.fontSize, height: 1.4),
          obscureText: passwordVisibility,
          // onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
          focusNode: widget.focusNode,
          controller: widget.controller,
          validator: widget.validator,
          keyboardType: widget.inputType,
          readOnly: widget.readOnly,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          autofocus: widget.autoFocus,
          textInputAction: TextInputAction.next,
          maxLines: widget.maxLines,
          autovalidateMode: widget.autovalidateMode,
          inputFormatters: [
            if (widget.acceptArabicCharOnly) FilteringTextInputFormatter.allow(RegExp('^[\u0621-\u064A\u0660-\u0669 ]+\$')),
            if (widget.acceptNumbersOnly) FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            fillColor: Colors.grey.shade200,
            focusColor: Colors.grey.shade200,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.blue),
            ),
            // focusedBorder: InputBorder.none,
            // enabledBorder: InputBorder.none,
            // errorBorder: InputBorder.none,
            // disabledBorder: InputBorder.none,
            filled: true,
            hintText: widget.hint,
            labelText: widget.labelText,
            errorMaxLines: 2,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      passwordVisibility ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => setState(() => passwordVisibility = !passwordVisibility),
                  )
                : widget.suffixIcon,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    if (widget.controller != null && widget.dispose) {
      widget.controller!.dispose();
    }
    super.dispose();
  }
}
