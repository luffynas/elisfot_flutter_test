import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:elisoft_flutter_test/bloc/fcm/fcm_bloc.dart';
import 'package:elisoft_flutter_test/bloc/main_bloc.dart';
import 'package:elisoft_flutter_test/bloc/theme/theme_cubit.dart';
import 'package:elisoft_flutter_test/l10n/l10n.dart';
import 'package:elisoft_flutter_test/modules/auth/bloc/auth_bloc.dart';
import 'package:elisoft_flutter_test/modules/auth/cubit/auth_page_cubit.dart';
import 'package:elisoft_flutter_test/modules/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:elisoft_flutter_test/modules/user/bloc/profile_bloc.dart';
import 'package:elisoft_flutter_test/route/router.gr.dart' as Router;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

GetIt getIt = GetIt.instance;

class App extends StatelessWidget {
  App({super.key});

  final _rootRouter = getIt<Router.AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..changeTheme()),
        BlocProvider(
          create: (context) => FcmBloc(),
        ),
        BlocProvider(
          create: (context) => MainBloc(
            fcmBloc: BlocProvider.of<FcmBloc>(context),
          )..add(const InitializeApp()),
        ),
        BlocProvider(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider(
          create: (context) =>
              AuthBloc(mainBloc: BlocProvider.of<MainBloc>(context)),
        ),
        BlocProvider(
          create: (context) => AuthPageCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return OverlaySupport.global(
            child: RefreshConfiguration(
              footerTriggerDistance: 15,
              dragSpeedRatio: 0.91,
              headerBuilder: () => const MaterialClassicHeader(),
              footerBuilder: () => const ClassicFooter(),
              shouldFooterFollowWhenNotFull: (state) {
                return false;
              },
              child: Portal(
                child: MaterialApp.router(
                  title: 'Edtrons',
                  useInheritedMediaQuery: true,
                  debugShowCheckedModeBanner: false,
                  routeInformationParser: _rootRouter.defaultRouteParser(),
                  routerDelegate: AutoRouterDelegate(
                    _rootRouter,
                    navigatorObservers: () => [AutoRouteObserver(), observer],
                  ),
                  theme: state is ThemeLight ? themeLight() : themeDark(),
                  builder: DevicePreview.appBuilder,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: const Locale('id', 'ID'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
