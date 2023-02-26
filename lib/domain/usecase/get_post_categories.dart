
import 'package:aksacademy/common/failure.dart';
import 'package:aksacademy/common/graphql/query/blogCategories.graphql.dart';
import 'package:aksacademy/domain/repository/post_category_repository.dart';
import 'package:either_dart/either.dart';

class GetPostCategories {
  final PostCategoryRepository repository;

  GetPostCategories(this.repository);

  Future<Either<Failure, Query$blogCategories$blogCategories?>> execute() {
    return repository.getPostCategories();
  }
}
