import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/pages/list_restaurants_page.dart';
import 'package:fluttter_fundamental_submission_2/src/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class GoRouteConfig {
  final GoRouter routes = GoRouter(
    initialLocation: '/splash',
    routes: <RouteBase>[
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/listRestaurantsPage',
        builder: (context, state) {
          return const ListRestaurantsPage();
        },
      ),
    ],
  );
}
