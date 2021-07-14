import 'package:alquran_alkarim/pages/home.page.dart';
import 'package:alquran_alkarim/pages/splash.page.dart';
import 'package:auto_route/auto_route.dart';
//export   'package:alquran_alkarim/utils/routes/routes.gr.dart';
export 'package:auto_route/auto_route.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',

  routes: <AutoRoute>[
    MaterialRoute(page: HomePage, initial: true),
    MaterialRoute(
      page: SplashPage,
      path: '/splash'
    ),
    MaterialRoute(
      page: HomePage,
      path: '/home'
    )
  ],
)

class $AppRouter {}
