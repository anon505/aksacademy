import 'package:aksacademy/common/configs.dart';
import 'package:dio/dio.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  // final AppSharedPreferences preferences;
  DioClient();
  Future<Dio> client(String flavor) async {
    // or new Dio with a BaseOptions instance.
    // String? token = preferences.getToken();
    final userAgent = await FkUserAgent.getPropertyAsync('userAgent');
    // final String ua = await userAgent();

    // print(ua);
    // print(await userAgentClientHintsHeader());
    final preferences = await SharedPreferences.getInstance();

    final token = preferences.getString('token');
    var options = BaseOptions(
      baseUrl: flavor == 'dev' ? Configs.restUrlDev : Configs.restUrlProd,
      followRedirects: false,
      sendTimeout: 0,
      connectTimeout: 0,
      receiveTimeout: 0,
      // will not throw errors
      validateStatus: (status) => true,

      headers: {
        "authorization": 'Bearer $token',
        'User-Agent': userAgent,
      },
    );
    Dio dio = Dio(options);
    return dio;
  }
}
