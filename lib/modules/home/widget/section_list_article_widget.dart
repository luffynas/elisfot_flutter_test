import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:elisoft_flutter_test/modules/home/bloc/articles/articles_bloc.dart';
import 'package:elisoft_flutter_test/modules/home/widget/list_shimmer_loading.dart';
import 'package:elisoft_flutter_test/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionListArticleWidget extends StatefulWidget {
  const SectionListArticleWidget({super.key});

  @override
  State<SectionListArticleWidget> createState() =>
      _SectionListArticleWidgetState();
}

class _SectionListArticleWidgetState extends State<SectionListArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          switch (state.status) {
            case ArticleStatus.initial:
            case ArticleStatus.loading:
              return const ListShimmerLoading();
            // return LoadingIndicator();
            case ArticleStatus.failure:
              return const Text('Failure Articles');
            case ArticleStatus.empty:
              return const Text('Empty Articles');
            case ArticleStatus.loadComplete:
            case ArticleStatus.stopLoadMore:
            case ArticleStatus.refreshComplete:
            case ArticleStatus.success:
              final articles = state.data;
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return AspectRatio(
                    aspectRatio: 1.7,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: AppRadius.lg,
                        border: Border.all(
                          color: AppColors.greenDark,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: AppRadius.lg,
                                  color: AppColors.gray[200],
                                ),
                                child: EdtronsImageWidget(
                                  placeholder:
                                      'assets/images/placeholder/placeholder.png',
                                  image: article.image ?? '',
                                  width: 80,
                                  height: 80,
                                  radius: AppRadius.lg,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  article.title ?? '',
                                  style: AppTypography.normalBold.copyWith(
                                    color: AppColors.greenDark,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            article.content ?? '',
                            style: AppTypography.smallMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                          ),
                          const SizedBox(height: 16),
                          Container(
                            alignment: Alignment.topRight,
                            child: Text(
                              // '08 April 2022, 08:34:55',
                              dateTimeUtils
                                  .formatedEvent(article.created!.date!),
                              style: AppTypography.smallMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
              );
          }
        },
      ),
    );
  }
}
