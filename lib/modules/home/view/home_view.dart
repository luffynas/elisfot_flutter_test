import 'dart:async';
import 'dart:developer';

import 'package:app_links/app_links.dart';
import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:elisoft_flutter_test/modules/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:elisoft_flutter_test/modules/user/bloc/profile_bloc.dart';
import 'package:elisoft_flutter_test/utils/utils.dart';
import 'package:elisoft_flutter_test/widgets/loading_indicator.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

bool _initialURILinkHandled = false;

class HomeView extends StatefulWidget {
  HomeView({Key? key, this.skip = false}) : super(key: key);
  final bool skip;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  late BottomNavigationBloc _bottomNavigationBloc;

  final PageStorageBucket bucket = PageStorageBucket();

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  String username() => spUtils.getString('username') ?? '';
  String userId() => spUtils.getString('user_id') ?? '';
  String role() => spUtils.getString('role') ?? '';

  @override
  void initState() {
    initDeepLinks();
    super.initState();

    _bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);
    _bottomNavigationBloc.add(SelectTab(index: 0));

    context.read<ProfileBloc>().add(const LoadProfile());
    // context.read<HeadingArticleBloc>().add(const LoadHeadingArticles());
    // context.read<ArticleBloc>().add(const LoadArticles());

    if (username().isNotEmpty) {
      NotificationUtil().firebaseCloudMessagingListeners(context);
      FirebaseCrashlytics.instance.setUserIdentifier(userId());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    // Check initial link if app was in cold state (terminated)
    final appLink = await _appLinks.getInitialAppLink();
    if (appLink != null) {
      log('getInitialAppLink: $appLink');
      openAppLink(appLink);
    }

    // Handle link when app is in warm state (front or background)
    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      log('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    AppLinkUtil.instance.handleAppLink(context, uri.toString());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        key: _key,
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: _buildUsername(),
        ),
        body: PageStorage(
          bucket: bucket,
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return const HomePage(
      key: PageStorageKey('dashboard'),
    );
  }

  Widget _buildUsername() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state.status) {
          case ProfileStatus.initial:
          case ProfileStatus.loading:
            return LoadingIndicator();
          case ProfileStatus.empty:
          case ProfileStatus.failure:
            return const Text('Failure Profile');
          case ProfileStatus.success:
            final user = state.user;
            return RichText(
              text: TextSpan(
                children: <InlineSpan>[
                  TextSpan(
                    text: 'Welcome, ',
                    style: AppTypography.normalRegular,
                  ),
                  TextSpan(
                    text: user?.name ?? '',
                    style: AppTypography.mediumMedium,
                  ),
                ],
              ),
            );
        }
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
