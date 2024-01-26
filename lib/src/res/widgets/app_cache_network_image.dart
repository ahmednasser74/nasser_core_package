// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:esu/core/mixin/index.dart';
// import 'package:esu/core/src/widgets/index.dart';
// import 'package:flutter/material.dart';

// class AppCacheNetworkImage extends StatelessWidget with ImageChatItemProperties {
//   const AppCacheNetworkImage({
//     Key? key,
//     required this.imageUrl,
//   }) : super(key: key);
//   final String imageUrl;

//   @override
//   Widget build(BuildContext context) {
//     return ConditionalBuilder(
//       condition: imageUrl.startsWith('http'),
//       builder: (_) => CachedNetworkImage(
//         imageUrl: imageUrl,
//         fit: BoxFit.cover,
//         imageBuilder: (context, imageProvider) => imageBuilder(context, imageProvider, imageUrl: imageUrl, isMe: true),
//         errorWidget: (context, url, error) => errorBuilder(context, url, error),
//         placeholder: (context, url) => placeHolder(context, isMe: true, imageUrl: url),
//       ),
//       fallback: (_) => Image.file(
//         File(imageUrl),
//         fit: BoxFit.cover,
//         errorBuilder: (context, error, stackTrace) => errorBuilderImage(context, error, stackTrace),
//         frameBuilder: (context, child, frame, wasSynchronouslyLoaded) => frameBuilderImage(
//           context,
//           child,
//           frame,
//           wasSynchronouslyLoaded,
//           imageUrl: imageUrl,
//           isMe: true,
//         ),
//       ),
//     );
//   }
// }
