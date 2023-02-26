import 'package:aksacademy/common/colors.dart';
import 'package:aksacademy/common/utils.dart';
import 'package:aksacademy/presentation/page/detail/detail_page.dart';
import 'package:aksacademy/presentation/page/payment/payment_page.dart';
import 'package:aksacademy/presentation/page/payment/payment_success_page.dart';
import 'package:aksacademy/presentation/page/profile/profile_edit_page.dart';
import 'package:aksacademy/presentation/page/profile/profile_page.dart';
import 'package:aksacademy/presentation/page/ticket/ticket_detail_page.dart';
import 'package:aksacademy/presentation/page/upload/upload_page.dart';
import 'package:aksacademy/presentation/provider/post_category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:aksacademy/injection.dart' as di;
import 'presentation/page/main/main_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => di.locator<PostCategoryProvider>(),
          ),
        ],
        child: MaterialApp(
          title: 'Aksacademy',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Inter',
              scaffoldBackgroundColor: BaseColors.white),
          home: const MainPage(),
          //home: LoginPage(),
          // home: const EventsPage(),
          // home: const EventOrderPage(),
          // home: UpgradePersonalDataPage(),
          navigatorObservers: [routeObserver],
          localizationsDelegates: const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[
            Locale('en', 'US'),
            Locale('id', 'ID'),
          ],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case DetailPage.routeName:
                return MaterialPageRoute(builder: (_) => const DetailPage());
              case PaymentPage.routeName:
                return MaterialPageRoute(builder: (_) => const PaymentPage());
              case PaymentSuccessPage.routeName:
                return MaterialPageRoute(
                    builder: (_) => const PaymentSuccessPage());
              case TicketDetailPage.routeName:
                return MaterialPageRoute(
                    builder: (_) => const TicketDetailPage());
              case ProfilePage.routeName:
                return MaterialPageRoute(builder: (_) => const ProfilePage());
              case UploadPage.routeName:
                return MaterialPageRoute(builder: (_) => const UploadPage());
              case ProfileEditPage.routeName:
                return MaterialPageRoute(
                    builder: (_) => const ProfileEditPage());
            }
            return null;
          },
        ));
  }
}
