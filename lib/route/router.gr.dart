// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../app_init.dart' as _i1;
import '../modules/auth/pages/auth_screen.dart' as _i3;
import '../modules/home/view/home_view.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Splash.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.InitializeScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      final args = routeData.argsAs<HomeScreenArgs>(
          orElse: () => const HomeScreenArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.HomeView(
          key: args.key,
          skip: args.skip,
        ),
      );
    },
    AuthScreen.name: (routeData) {
      final args = routeData.argsAs<AuthScreenArgs>(
          orElse: () => const AuthScreenArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.AuthScreen(
          key: args.key,
          onSuccess: args.onSuccess,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          Splash.name,
          path: '/splash',
        ),
        _i4.RouteConfig(
          HomeScreen.name,
          path: '/home',
        ),
        _i4.RouteConfig(
          AuthScreen.name,
          path: 'auth',
        ),
      ];
}

/// generated route for
/// [_i1.InitializeScreen]
class Splash extends _i4.PageRouteInfo<void> {
  const Splash()
      : super(
          Splash.name,
          path: '/splash',
        );

  static const String name = 'Splash';
}

/// generated route for
/// [_i2.HomeView]
class HomeScreen extends _i4.PageRouteInfo<HomeScreenArgs> {
  HomeScreen({
    _i5.Key? key,
    bool skip = false,
  }) : super(
          HomeScreen.name,
          path: '/home',
          args: HomeScreenArgs(
            key: key,
            skip: skip,
          ),
        );

  static const String name = 'HomeScreen';
}

class HomeScreenArgs {
  const HomeScreenArgs({
    this.key,
    this.skip = false,
  });

  final _i5.Key? key;

  final bool skip;

  @override
  String toString() {
    return 'HomeScreenArgs{key: $key, skip: $skip}';
  }
}

/// generated route for
/// [_i3.AuthScreen]
class AuthScreen extends _i4.PageRouteInfo<AuthScreenArgs> {
  AuthScreen({
    _i5.Key? key,
    dynamic Function(
      _i5.BuildContext,
      bool,
    )?
        onSuccess,
  }) : super(
          AuthScreen.name,
          path: 'auth',
          args: AuthScreenArgs(
            key: key,
            onSuccess: onSuccess,
          ),
        );

  static const String name = 'AuthScreen';
}

class AuthScreenArgs {
  const AuthScreenArgs({
    this.key,
    this.onSuccess,
  });

  final _i5.Key? key;

  final dynamic Function(
    _i5.BuildContext,
    bool,
  )? onSuccess;

  @override
  String toString() {
    return 'AuthScreenArgs{key: $key, onSuccess: $onSuccess}';
  }
}
