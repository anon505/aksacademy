import 'dart:async';

import 'package:aksacademy/common/graphql/graphql_util.dart';
import 'package:aksacademy/common/graphql/query/blogCategories.graphql.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

abstract class PostCategoryRemoteDataSource {
  Future<Query$blogCategories$blogCategories?> getPostCategories();
}

class PostCategoryRemoteDataSourceImpl implements PostCategoryRemoteDataSource {
  PostCategoryRemoteDataSourceImpl();

  @override
  Future<Query$blogCategories$blogCategories?> getPostCategories() async {
    final result = await GetIt.I<GraphQLClient>().query$blogCategories(
        Options$Query$blogCategories(fetchPolicy: FetchPolicy.networkOnly));
    checkError(result);
    return result.parsedData?.blogCategories;
  }
}
