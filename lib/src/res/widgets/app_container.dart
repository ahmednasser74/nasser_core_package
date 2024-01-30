import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppContainerImgType { asset, network, file }

class AppContainer extends StatelessWidget {
  const AppContainer({
    Key? key,
    this.child,
    this.horizontalPadding = 8,
    this.verticalPadding = 8,
    this.color = Colors.white,
    this.borderColor,
    this.borderWidth = 0,
    this.borderRadius,
    this.boxShadowOffset = Offset.zero,
    this.boxShadowBlurColor,
    this.hasShadow = false,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.alignment,
    this.hasBorder = true,
    this.shadowSpreadRadius = 0,
    this.constraints,
    this.shape,
    this.onTap,
    this.image,
    this.imgType = AppContainerImgType.asset,
    this.fit,
  }) : super(key: key);

  final Widget? child;
  final double horizontalPadding;
  final double verticalPadding;
  final double? borderRadius;
  final Color color;
  final Color? borderColor;
  final double borderWidth;
  final Offset? boxShadowOffset;
  final Color? boxShadowBlurColor;
  final bool hasShadow;
  final double? height;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment;
  final bool hasBorder;
  final double shadowSpreadRadius;
  final BoxConstraints? constraints;
  final BoxShape? shape;
  final VoidCallback? onTap;
  final dynamic image;
  final BoxFit? fit;
  final AppContainerImgType? imgType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height?.h,
        width: width?.w,
        padding: padding,
        margin: margin,
        alignment: alignment,
        constraints: constraints,
        decoration: BoxDecoration(
          color: color,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius!.r) : null,
          border: hasBorder ? Border.all(color: borderColor ?? Theme.of(context).primaryColor, width: borderWidth) : null,
          image: image != null ? DecorationImage(image: _buildImage(), fit: fit) : null,
          boxShadow: hasShadow
              ? [
                  BoxShadow(
                    color: boxShadowBlurColor?.withOpacity(.7) ?? Theme.of(context).colorScheme.secondary,
                    offset: boxShadowOffset ?? const Offset(0, 8),
                    blurRadius: 8,
                    spreadRadius: shadowSpreadRadius,
                  )
                ]
              : null,
        ),
        child: child,
      ),
    );
  }

  ImageProvider _buildImage() {
    switch (imgType) {
      case AppContainerImgType.asset:
        return AssetImage(image);
      case AppContainerImgType.network:
        return NetworkImage(image);
      case AppContainerImgType.file:
        return FileImage(image);
      default:
        return AssetImage(image!);
    }
  }
}
