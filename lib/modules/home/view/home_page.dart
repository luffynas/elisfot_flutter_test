import 'package:elisoft_flutter_test/modules/home/bloc/articles/articles_bloc.dart';
import 'package:elisoft_flutter_test/modules/home/bloc/heading_article/heading_articles_bloc.dart';
import 'package:elisoft_flutter_test/modules/home/widget/section_heading_article_widget.dart';
import 'package:elisoft_flutter_test/modules/home/widget/section_list_article_widget.dart';
import 'package:elisoft_flutter_test/widgets/smart_refresher_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _refreshController = RefreshController();

  final headingArticleBloc = HeadingArticleBloc();
  final articleBloc = ArticleBloc();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _onRefresh(
    BuildContext context,
    RefreshController controller,
  ) async {
    BlocProvider.of<HeadingArticleBloc>(context).add(
      const LoadHeadingArticles(fresh: true),
    );
    BlocProvider.of<ArticleBloc>(context).add(
      const LoadArticles(fresh: true),
    );
  }

  @override
  void didChangeDependencies() {
    headingArticleBloc.stream.listen((state) {
      switch (state.status) {
        case HeadingArticleStatus.initial:
        case HeadingArticleStatus.loading:
        case HeadingArticleStatus.success:
        case HeadingArticleStatus.failure:
          break;
        case HeadingArticleStatus.refreshComplete:
          _refreshController.refreshCompleted();
          break;
        case HeadingArticleStatus.loadComplete:
          if (mounted) _refreshController.loadComplete();
          break;
        case HeadingArticleStatus.empty:
        case HeadingArticleStatus.stopLoadMore:
          _refreshController.loadComplete();
          _refreshController.loadNoData();
          break;
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              headingArticleBloc..add(const LoadHeadingArticles()),
        ),
        BlocProvider(
          create: (context) => articleBloc..add(const LoadArticles()),
        ),
      ],
      child: SmartRefresherWidget(
        key: const PageStorageKey('home_widget'),
        enablePullUp: false,
        onRefresh: _onRefresh,
        // onLoading: null,
        builder: (BuildContext context, RefreshController refreshController) {
          _refreshController = refreshController;
          return const CustomScrollView(
            slivers: [
              SectionHeadingArticleWidget(),
              SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
              SectionListArticleWidget(),
            ],
          );
        },
      ),
    );
  }
}
