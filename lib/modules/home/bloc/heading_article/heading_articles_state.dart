part of 'heading_articles_bloc.dart';

enum HeadingArticleStatus {
  initial,
  loading,
  success,
  refreshComplete,
  loadComplete,
  stopLoadMore,
  failure,
  empty,
}

class HeadingArticleState extends Equatable {
  const HeadingArticleState({
    this.status = HeadingArticleStatus.initial,
    this.data = const [],
    this.message = '',
  });

  final HeadingArticleStatus status;
  final List<Article> data;
  final String message;

  HeadingArticleState copy({
    HeadingArticleStatus? status,
    List<Article>? data,
    String? message,
  }) =>
      HeadingArticleState(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [status, data, message];
}
