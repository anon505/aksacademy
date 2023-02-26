import 'dart:async';
import 'dart:io';
import 'package:aksacademy/common/failure.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:get_it/get_it.dart';

abstract class UploadRemoteDataSource {
  Future<String?> doUploadPhoto(String imagePath);
}

class UploadRemoteDataSourceImpl implements UploadRemoteDataSource {
  UploadRemoteDataSourceImpl();

  @override
  Future<String?> doUploadPhoto(String imagePath) async {
    try {
      String fileName = imagePath.split('/').last;
      GetIt.I<Dio>().options.contentType = 'multipart/form-data';
      Map<String, dynamic> map = {
        'fileName': await MultipartFile.fromFile(
          imagePath,
          filename: fileName,
          contentType: MediaType("image", "jpeg"),
        ),
      };
      var formData = FormData.fromMap(map);
      final response = await GetIt.I<Dio>().post('/post', data: formData);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return "Success";
      } else {
        throw RequestFailure(response.statusCode ?? -1,
            response.statusMessage ?? ""); //parsing response body to json
      }
    } on SocketException {
      throw const RequestFailure(-1, 'Not connected');
    }
  }
}
