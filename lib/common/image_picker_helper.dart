import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_exif_rotation/flutter_exif_rotation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

Future<String?> getLostData(ImagePicker picker) async {
  final LostDataResponse response = await picker.retrieveLostData();
  if (response.isEmpty) {
    return '';
  }
  if (response.file != null) {
    return response.file?.path;
  } else {
    // TODO: - Handle Error
    // _handleError(response.exception);
  }
}

Future<List<String>?> getImagesPath(List<XFile> files) async {
  List<String?> compressedPaths =
      await Future.wait(files.map((i) => getImagePath(i)));
  return compressedPaths.map((e) => e.toString()).toList();
}

CompressFormat determineCompressionFormat(String path) {
  switch (path.split('.').last) {
    case 'webp':
      return CompressFormat.webp;
    case 'heic':
      return CompressFormat.heic;
    case 'png':
      return CompressFormat.png;
    default:
      return CompressFormat.jpeg;
  }
}

Future<File?> compressFile(String path) async {
  try {
    return await FlutterImageCompress.compressAndGetFile(
      path,
      // "${i.absolute.path.split('.jpg')[0]}_compressed.jpg",
      getCompressedPath(path),
      minWidth: 680,
      minHeight: 480,
      format: determineCompressionFormat(path),
      quality: 70,
      autoCorrectionAngle: false,
    );
  } catch (error) {
    if (kDebugMode) {
      print('There is Error in Compressing $error');
    }
    return null;
  }
}

Future<String?> getImagePath(XFile file) async {
  File? compressed = await compressFile(file.path);
  final rotatedFile = await getRotatedPath(compressed?.path ?? file.path);
  if (kDebugMode) {
    final leg = await file.length();
    print(
        "Compress ============================================================");
    print('compressed File $compressed');

    print(leg);
    print('rotate ${rotatedFile.lengthSync()}');
    print('compressed ${compressed?.lengthSync()}');
  }
  return rotatedFile.path;
}

Future<File> getRotatedPath(String path) async {
  return await FlutterExifRotation.rotateImage(path: path);
}

String getCompressedPath(String path) {
  final map = path.split('.');
  final removedExtMap = map.removeLast();
  String compressedPath = '';
  map.forEach((element) {
    compressedPath = '$compressedPath.$element';
  });
  compressedPath = '${compressedPath}_compressed.$removedExtMap';
  return compressedPath;
}
