import 'package:aksacademy/common/app_shared_preferences.dart';
import 'package:aksacademy/common/configs.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';

class GraphQLConfiguration {
  GraphQLConfiguration();
  Future<GraphQLClient> getClient(String flavor) async {
    final userAgent = await FkUserAgent.getPropertyAsync('userAgent');
    final token = GetIt.I<AppSharedPreferences>().getToken();
    final HttpLink httpLink = HttpLink(
        '${flavor == 'dev' ? Configs.baseUrlDev : Configs.baseUrlProd}/graphql',
        defaultHeaders: {
          'User-Agent': userAgent ?? 'unidentified',
        });
    Link finalLink=httpLink;
    if(token!=null && token!='') {
      final AuthLink authLink = AuthLink(
        getToken: () => 'Bearer $token',
      );
      finalLink=authLink.concat(httpLink);
    }
    return GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link: finalLink,
    );
  }
}
