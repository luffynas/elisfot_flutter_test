part of 'articles_bloc.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class LoadArticles extends ArticleEvent {
  const LoadArticles({this.fresh = false});

  final bool fresh;
}
