import 'package:auto_route/auto_route.dart';
import '../../presentation/home/home_page.dart';
import '../../presentation/auth/login_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: HomeRoute.page, initial: true),
    AutoRoute(path: '/login', page: LoginRoute.page),
  ];
}
