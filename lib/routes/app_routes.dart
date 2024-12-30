import 'package:api_learn/Module/Users/users_view.dart';
import 'package:api_learn/Module/deails/detai_view.dart';
import 'package:api_learn/Module/homepage/view/home_view.dart';
import 'package:api_learn/Module/sharedPreferences/sharedPreferences_view.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static GoRouter router = GoRouter(
    initialLocation: UsersView.route,
    routes: [
      GoRoute(
        path: UsersView.route,
        name: UsersView.routeName,
        builder: (context, state) => const UsersView(),
      ),
      GoRoute(
        path: SharedPreferencesView.route,
        name: SharedPreferencesView.routeName,
        builder: (context, state) => const SharedPreferencesView(),
      ),
      GoRoute(
        path: DetailView.route,
        name: DetailView.routeName,
        builder: (context, state) => const DetailView(),
      ),
      GoRoute(
        path: HomeView.route,
        name: HomeView.routeName,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
