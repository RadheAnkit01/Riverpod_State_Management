import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/coin%20mini%20proj/coin_price_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/coin%20mini%20proj/coin_status_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/counter_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/future_user_list_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/user_details_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/user_list_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user/user_stream_screen.dart';
import 'package:riverpod_statemanagement/By%20Code%20With%20Richard/screen/user_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "/",
    routes: <RouteBase>[
      GoRoute(
        path: "/",
        builder: (context, state) => CounterScreenRichard(),
        routes: <RouteBase>[
          GoRoute(
            path: "coinStatus",
            builder: (context, state) => CoinStatusScreen(),
            routes: <RouteBase>[
              GoRoute(
                path: "coinPrice/:productId",
                builder: (context, state) {
                  final productId = state.pathParameters['productId'] ?? '';
                  return CoinPriceScreen(productIds: [productId]);
                },
              ),
            ],
          ),
          GoRoute(
            path: "userScreen",
            builder: (context, state) {
              return UserScreen();
            },
          ),
          GoRoute(
            path: "userListScreen",
            builder: (context, state) {
              return UserListScreen();
            },
          ),
          GoRoute(
            path: "userDetailScreen",
            builder: (context, state) {
              return UserDetailsScreen();
            },
          ),
          GoRoute(
            path: "futureUserListScreen",
            builder: (context, state) {
              return FutureUserListScreen();
            },
          ),
          GoRoute(
            path: "userStreamScreen",
            builder: (context, state) {
              return UserStreamScreen();
            },
          ),
        ],
      ),
    ],
  );
});
