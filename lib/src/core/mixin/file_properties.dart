import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nasser_core_package/nasser_core_package.dart';

import 'package:path/path.dart' as path;

mixin FileProperties {
  Future<File?> pickedFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path ?? '');
      return file;
    } else {
      return null;
    }
  }

  Future<String> getFileSize({
    required String filepath,
    required int decimals,
  }) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    final fileSize = '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
    return fileSize;
  }

  Future<bool> isFileLowerThanTenMega({required String filepath}) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes < 10485760) {
      return true;
    } else {
      return false;
    }
  }

  List<String> imageExtensions = [
    '.apng',
    '.avif',
    '.gif',
    '.jpg',
    '.jpeg',
    '.jfif',
    '.pjpeg',
    '.pjp',
    '.png',
    '.svg',
    '.webp',
  ];

  bool fileIsImage({required String fileName}) {
    String extension = ".${fileName.split('.').last}";
    return imageExtensions.contains(extension);
  }

  Future<({File file, String path})?> pickedImage({required ImageSource source}) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source, imageQuality: 50);
      if (pickedFile == null) return null;

      final path = pickedFile.path;
      final imageAsFile = await convertImageToFile(path);
      return (path: path, file: imageAsFile);
    } catch (e) {
      Fluttertoast.showToast(msg: 'pleaseAllowCameraPermission'.translate, backgroundColor: Colors.red, textColor: Colors.white);
      return null;
    }
  }

  Future<File> convertImageToFile(String imagePath) async {
    final imageFile = File(imagePath);
    final bytes = await imageFile.readAsBytes();
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/${getFileNameFromImagePath(imagePath)}';
    final tempFile = File(tempPath);
    await tempFile.writeAsBytes(bytes);
    return tempFile;
  }

  String getFileNameFromImagePath(String imagePath) {
    return path.basename(imagePath);
  }
}
