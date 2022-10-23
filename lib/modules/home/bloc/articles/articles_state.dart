part of 'articles_bloc.dart';

enum ArticleStatus {
  initial,
  loading,
  success,
  refreshComplete,
  loadComplete,
  stopLoadMore,
  failure,
  empty,
}

class ArticleState extends Equatable {
  const ArticleState({
    this.status = ArticleStatus.initial,
    this.data = const [],
    this.message = '',
  });

  final ArticleStatus status;
  final List<Article> data;
  final String message;

  ArticleState copy({
    ArticleStatus? status,
    List<Article>? data,
    String? message,
  }) =>
      ArticleState(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [status, data, message];
}
