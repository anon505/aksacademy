import 'package:aksacademy/common/failure.dart';
import 'package:aksacademy/data/remote/upload_remote_data_source.dart';
import 'package:either_dart/either.dart';

abstract class UploadRepository {
  Future<Either<Failure, String?>> doUploadPhoto(String imagePath);
}
class UploadRepositoryImpl implements UploadRepository {
  final UploadRemoteDataSource remoteDataSource;

  UploadRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, String?>> doUploadPhoto(String imagePath) async {
    try {
      final result = await remoteDataSource.doUploadPhoto(imagePath);
      return Right(result);
    } on RequestFailure catch (it) {
      return Left(it);
    }
  }
}

