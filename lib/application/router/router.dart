import 'package:auto_route/auto_route.dart';
import 'package:sport_sync_pro/application/router/router_guard.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/authentication/presentation/pages/login_page.dart';
import '../../features/authentication/presentation/pages/authentication_page.dart';
import '../../features/user/presentation/pages/user_profile_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: HomeRoute.page, initial: true),
    AutoRoute(path: '/login', page: LoginRoute.page),
    AutoRoute(path: '/auth', page: AuthenticationRoute.page),
    AutoRoute(path: '/profile', page: UserProfileRoute.page, guards: [AuthGuard()]),
  ];
}
