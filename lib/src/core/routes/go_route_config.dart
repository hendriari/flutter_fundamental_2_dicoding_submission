import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/pages/add_review_page.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/pages/detail_restaurants_page.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/pages/list_restaurants_page.dart';
import 'package:fluttter_fundamental_submission_2/src/features/restaurants/presentation/pages/search_restaurants_page.dart';
import 'package:fluttter_fundamental_submission_2/src/features/splash/presentation/pages/splash_page.dart';
import 'package:go_router/go_router.dart';

class GoRouteConfig {
  final GoRouter routes = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/restaurants',
        builder: (context, state) {
          return const ListRestaurantsPage();
        },
        routes: [
          GoRoute(
            name: 'search-restaurants',
            path: 'search-restaurants',
            builder: (context, state) {
              return const SearchRestaurantsPage();
            },
          ),
          GoRoute(
              name: 'restaurants-detail',
              path: 'restaurants-detail/:id',
              builder: (context, state) {
                return DetailRestaurantsPage(
                  id: state.pathParameters['id'],
                );
              },
              routes: [
                GoRoute(
                  name: 'add-review',
                  path: 'add-review',
                  builder: (context, state) {
                    return const AddReviewPage();
                  },
                ),
              ]),
        ],
      ),
    ],
  );
}
