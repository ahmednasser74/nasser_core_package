import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nasser_core_package/nasser_core_package.dart';

class AppMultipleImagePickerWidget extends StatefulWidget {
  final void Function(List<String> filesPath) onSelectImage;
  final int maxImages;
  final String? title;

  const AppMultipleImagePickerWidget({
    Key? key,
    required this.onSelectImage,
    this.maxImages = 5,
    this.title,
  }) : super(key: key);

  @override
  State<AppMultipleImagePickerWidget> createState() => _AppMultipleImagePickerWidgetState();
}

class _AppMultipleImagePickerWidgetState extends State<AppMultipleImagePickerWidget> with FileProperties {
  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: images.map((e) => _imageListWidget(e)).toList(),
        ),
        8.heightBox,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (images.length == widget.maxImages) _racedMaxSelectedImagesWarning(context),
            12.widthBox,
            Expanded(child: _addPhotosWidget(context)),
          ],
        ),
      ],
    );
  }

  Widget _addPhotosWidget(BuildContext context) {
    return AppButton(
      onTap: () async {
        if (images.length != widget.maxImages) {
          final List<String>? pickedImages = await pickedMultipleImages();
          if (pickedImages != null) {
            images.addAll(pickedImages);
            if (images.length > widget.maxImages) {
              images.length = widget.maxImages;
            }
            widget.onSelectImage(images);
            setState(() {});
          }
        }
      },
      backgroundColor: images.length != widget.maxImages ? Theme.of(context).primaryColor : Colors.grey,
      paddingHorizontal: 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, color: Colors.black, size: 16.sp),
          8.widthBox,
          AppText(widget.title ?? 'addPhotos'.translate, color: Colors.black, size: 12.sp, align: TextAlign.center),
        ],
      ),
    );
  }

  Stack _imageListWidget(String e) {
    return Stack(
      children: [
        AppContainer(
          height: 60.h,
          width: 60.w,
          borderRadius: 6.r,
          margin: EdgeInsetsDirectional.only(end: 12.w, top: 12.h),
          imgType: AppContainerImgType.file,
          image: File(e),
          borderColor: Colors.white,
          fit: BoxFit.fill,
        ),
        PositionedDirectional(
          end: 6,
          child: AppContainer(
            onTap: () {
              setState(() => images.remove(e));
              widget.onSelectImage(images);
            },
            color: Colors.transparent,
            shape: BoxShape.circle,
            height: 12.h,
            width: 12.h,
            child: Icon(Icons.remove_circle_outline_sharp, color: Colors.black, size: 16.r),
          ),
        ),
      ],
    );
  }

  Widget _racedMaxSelectedImagesWarning(BuildContext context) {
    return AppContainer(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
      borderRadius: 4.r,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 5.w),
            child: Icon(Icons.auto_awesome, size: 12.sp, color: Colors.black),
          ),
          AppText(
            '${'sorryYouCanNotUploadMoreThan'.translate} ${widget.maxImages} ${'images'.translate}',
            size: 11.sp,
          ),
        ],
      ),
    );
  }
}
