import 'package:edtrons_ui/edtrons_ui.dart';
import 'package:elisoft_flutter_test/modules/home/bloc/heading_article/heading_articles_bloc.dart';
import 'package:elisoft_flutter_test/modules/home/widget/heading_shimmer_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SectionHeadingArticleWidget extends StatelessWidget {
  const SectionHeadingArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocBuilder<HeadingArticleBloc, HeadingArticleState>(
        builder: (context, state) {
          switch (state.status) {
            case HeadingArticleStatus.initial:
            case HeadingArticleStatus.loading:
              return const HeadingShimmerLoading();
            case HeadingArticleStatus.failure:
              return const Text('Failure Heading');
            case HeadingArticleStatus.empty:
              return const Text('Empty Heading');
            case HeadingArticleStatus.loadComplete:
            case HeadingArticleStatus.refreshComplete:
            case HeadingArticleStatus.stopLoadMore:
            case HeadingArticleStatus.success:
              final articles = state.data;
              return Container(
                height: 160,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
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
                            Text(
                              article.title ?? '',
                              style: AppTypography.normalBold.copyWith(
                                color: AppColors.greenDark,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              article.content ?? '',
                              style: AppTypography.smallMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(width: 16);
                  },
                ),
              );
          }
        },
      ),
    );
  }
}
