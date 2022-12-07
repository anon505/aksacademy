import 'package:aksacademy/common/app_shared_preferences.dart';
import 'package:aksacademy/common/configs.dart';
import 'package:aksacademy/common/dio.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
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
  // external
  locator.registerSingletonAsync<Dio>(() => DioClient().client(flavor));
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Configs(flavor));
}

void resetExternal() {
  locator.registerSingletonAsync<Dio>(() => DioClient().client(_flavor));
}
