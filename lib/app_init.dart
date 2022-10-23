import 'dart:developer';

import 'package:elisoft_flutter_test/bloc/main_bloc.dart';
import 'package:elisoft_flutter_test/modules/auth/pages/auth_screen.dart';
import 'package:elisoft_flutter_test/modules/home/view/home_view.dart';
import 'package:elisoft_flutter_test/modules/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitializeScreen extends StatelessWidget {
  const InitializeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        log('message ::: $state');
        switch (state.mainType) {
          case MainType.onboarding:
            return const SizedBox();
          case MainType.unauthenticated:
            return const AuthScreen();
          case MainType.authenticated:
            return HomeView();
          case MainType.initial:
          case MainType.loading:
          case MainType.failure:
            return const SplashPage();
        }
      },
    );
  }
}
