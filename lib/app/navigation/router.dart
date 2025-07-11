import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:fskeleton/app/data/auth/auth_repository.dart';
import 'package:fskeleton/app/data/wms/model/wms_bundle/wms_bundle.dart';
import 'package:fskeleton/core.dart';
import 'package:fskeleton/feature/ecommerce/ecommerce_search_screen.dart';
import 'package:fskeleton/feature/history/history_screen.dart';
import 'package:fskeleton/feature/history/product_bundle_screen.dart';
import 'package:fskeleton/feature/home/home_screen.dart';
import 'package:fskeleton/feature/login/login_screen.dart';
import 'package:fskeleton/feature/result/product_detail_params.dart';
import 'package:fskeleton/feature/result/product_detail_screen.dart';
import 'package:fskeleton/feature/search/search_screen.dart';
import 'package:fskeleton/feature/success/success_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter(this._authRepository);

  static final provider =
      Provider((ref) => AppRouter(ref.watch(AuthRepository.provider)));

  static const loginRoute = 'login';
  static const homeRoute = 'home';
  static const productDetailRoute = 'product-detail';
  static const successRoute = 'success_list';
  static const searchRoute = 'search_screen_route';
  static const historyRoute = 'history';
  static const ecommerceSearchRoute = 'ecommerce-search';
  static const addProductToBundleRoute = 'add-product-to-bundle';

  final AuthRepository _authRepository;

  late final router = GoRouter(
    initialLocation: '/$homeRoute',
    refreshListenable: _StreamListenable(_authRepository.isLoggedInStream),
    redirect: (context, state) async {
      final isLoggedIn = await _authRepository.isLoggedIn();
      final isLoginRequired = !(state.fullPath?.contains(loginRoute) ?? false);
      if (!isLoggedIn && isLoginRequired) {
        return '/$loginRoute';
      }

      return null;
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return child;
        },
        routes: [
          GoRoute(
            name: loginRoute,
            path: '/$loginRoute',
            builder: (context, state) {
              return LoginScreen(
                onSuccessLogin: () {
                  context.pushNamed(AppRouter.homeRoute);
                },
              );
            },
          ),
          GoRoute(
            name: homeRoute,
            path: '/$homeRoute',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            name: productDetailRoute,
            path: '/$productDetailRoute',
            builder: (context, state) {
              final params = state.extra! as ProductDetailParams;
              return ProductDetailScreen(params: params);
            },
          ),
          GoRoute(
            name: successRoute,
            path: '/$successRoute',
            builder: (context, state) {
              return const SuccessScreen();
            },
          ),
          GoRoute(
            name: searchRoute,
            path: '/$searchRoute',
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            name: historyRoute,
            path: '/$historyRoute',
            builder: (context, state) {
              return const HistoryScreen();
            },
          ),
          GoRoute(
            name: addProductToBundleRoute,
            path: '/$addProductToBundleRoute',
            builder: (context, state) {
              final bundle = state.extra! as WmsBundle;
              return ProductBundleScreen(bundle: bundle);
            },
          ),
          GoRoute(
            name: ecommerceSearchRoute,
            path: '/$ecommerceSearchRoute',
            builder: (context, state) {
              final params = state.extra! as Map<String, String>;
              return EcommerceSearchScreen(searchParams: params);
            },
          ),
        ],
      ),
    ],
  );
}

class _StreamListenable extends ChangeNotifier {
  _StreamListenable(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
