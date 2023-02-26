import 'package:aksacademy/common/app_shared_preferences.dart';
import 'package:aksacademy/common/configs.dart';
import 'package:aksacademy/common/dio.dart';
import 'package:aksacademy/common/graphql/graphql_configuration.dart';
import 'package:aksacademy/data/remote/post_category_remote_data_source.dart';
import 'package:aksacademy/data/remote/upload_remote_data_source.dart';
import 'package:aksacademy/domain/repository/post_category_repository.dart';
import 'package:aksacademy/domain/repository/upload_repository.dart';
import 'package:aksacademy/domain/usecase/do_upload.dart';
import 'package:aksacademy/domain/usecase/get_post_categories.dart';
import 'package:aksacademy/presentation/provider/post_category_provider.dart';
import 'package:aksacademy/presentation/provider/upload_provider.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

late String _flavor;
void init(String flavor) {
  _flavor = flavor;
  locator.allowReassignment = true;
  locator.registerSingletonAsync<SharedPreferences>(
          () => SharedPreferences.getInstance());
  locator.registerLazySingleton<AppSharedPreferences>(
      () => AppSharedPreferences(preferences: locator()));

  // Providers
  locator.registerFactory(() => PostCategoryProvider(
      getPostCategories: locator(),));
  locator.registerFactory(() => UploadProvider(
    doUpload: locator(),));

  // Use Cases
  locator.registerLazySingleton(() => GetPostCategories(locator()));
  locator.registerLazySingleton(() => DoUpload(locator()));

  // Remote Data Sources
  locator.registerLazySingleton<PostCategoryRemoteDataSource>(() =>
      PostCategoryRemoteDataSourceImpl());
  locator.registerLazySingleton<UploadRemoteDataSource>(() =>
      UploadRemoteDataSourceImpl());

  // Repositories
  locator.registerLazySingleton<PostCategoryRepository>(
        () => PostCategoryRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<UploadRepository>(
        () => UploadRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  // external
  locator.registerSingletonAsync<GraphQLClient>(
          () => GraphQLConfiguration().getClient(flavor));
  locator.registerSingletonAsync<Dio>(() => DioClient().client(flavor));
  locator.registerLazySingleton(() => Configs(flavor));
}

void resetExternal() {
  locator.registerSingletonAsync<Dio>(() => DioClient().client(_flavor));
  locator.registerSingletonAsync<GraphQLClient>(
          () => GraphQLConfiguration().getClient(_flavor));
}
