import 'package:aksacademy/common/failure.dart';
import 'package:aksacademy/common/graphql/query/blogCategories.graphql.dart';
import 'package:aksacademy/common/state_enum.dart';
import 'package:aksacademy/domain/usecase/get_post_categories.dart';
import 'package:flutter/material.dart';

class PostCategoryProvider extends ChangeNotifier {

  Query$blogCategories$blogCategories? _postCategoriesData;
  Query$blogCategories$blogCategories? get postCategoriesData => _postCategoriesData;

  RequestState _postCategoriesState = RequestState.Empty;
  RequestState get postCategoriesState => _postCategoriesState;

  RequestFailure? _postCategoriesFailure;
  RequestFailure? get postCategoriesFailure => _postCategoriesFailure;
  PostCategoryProvider({
    required this.getPostCategories,
  });

  final GetPostCategories getPostCategories;


  Future<void> doGetPostCategories() async {
    _postCategoriesState = RequestState.Loading;
    notifyListeners();

    final result = await getPostCategories.execute();
    result.fold(
      (failure) {
        _postCategoriesState = RequestState.Error;
        _postCategoriesFailure = failure as RequestFailure?;
        notifyListeners();
      },
      (result) {
        _postCategoriesState = RequestState.Loaded;
        _postCategoriesData = result;
        notifyListeners();
      },
    );
  }
}
