
import 'package:aksacademy/common/failure.dart';
import 'package:aksacademy/domain/repository/upload_repository.dart';
import 'package:either_dart/either.dart';

class DoUpload {
  final UploadRepository repository;

  DoUpload(this.repository);

  Future<Either<Failure, String?>> execute(String imagePath) {
    return repository.doUploadPhoto(imagePath);
  }
}
