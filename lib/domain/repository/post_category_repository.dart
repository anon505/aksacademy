

import 'package:aksacademy/common/failure.dart';
import 'package:aksacademy/common/graphql/query/blogCategories.graphql.dart';
import 'package:aksacademy/data/remote/post_category_remote_data_source.dart';
import 'package:either_dart/either.dart';

abstract class PostCategoryRepository {
  Future<Either<Failure, Query$blogCategories$blogCategories?>>
      getPostCategories();
}
class PostCategoryRepositoryImpl implements PostCategoryRepository {
  final PostCategoryRemoteDataSource remoteDataSource;

  PostCategoryRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, Query$blogCategories$blogCategories?>>
  getPostCategories() async {
    try {
      final result = await remoteDataSource.getPostCategories();
      return Right(result);
    } on RequestFailure catch (it) {
      return Left(it);
    }
  }
}

