import 'package:auto_route/auto_route.dart';
import 'package:elisoft_flutter_test/app_init.dart';
import 'package:elisoft_flutter_test/modules/auth/pages/auth_screen.dart';
import 'package:elisoft_flutter_test/modules/home/view/home_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: InitializeScreen,
      path: '/splash',
      name: 'splash',
      initial: true,
    ),
    AutoRoute(
      page: HomeView,
      path: '/home',
      name: 'homeScreen',
    ),
    AutoRoute(
      page: AuthScreen,
      path: 'auth',
      name: 'authScreen',
    ),
    // AutoRoute(path: "*", page: UnknownRouteScreen)
  ],
)
class $AppRouter {}
