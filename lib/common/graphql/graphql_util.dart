
import 'package:aksacademy/common/failure.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql/client.dart';

void checkError(QueryResult<Object?> result) {
  if (result.hasException) {
    final err = result.exception!;
    int errCode = 500;
    String message = result.exception.toString();
    if (kDebugMode) {
      print(message);
    }
    if (err.linkException != null) {
      throw const RequestFailure(-1, 'Not connected');
    }
    var ext = err.graphqlErrors.first.extensions?['response'];
    errCode = ext != null ? ext['statusCode'] : 500;
    message = err.graphqlErrors.first.message;
    throw RequestFailure(errCode, message);
  }
}
