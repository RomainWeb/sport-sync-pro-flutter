import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sport_sync_pro/application/router/router.dart';


class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    User? user = FirebaseAuth.instance.currentUser;

    if(user != null){
      print(user);
      // if user is authenticated we continue
      resolver.next(true);
    }else{
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(const LoginRoute());
    }
  }
}
