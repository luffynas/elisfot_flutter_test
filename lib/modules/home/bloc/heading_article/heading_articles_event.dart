part of 'heading_articles_bloc.dart';

abstract class HeadingArticleEvent extends Equatable {
  const HeadingArticleEvent();

  @override
  List<Object> get props => [];
}

class LoadHeadingArticles extends HeadingArticleEvent {
  const LoadHeadingArticles({this.fresh = false});

  final bool fresh;
}
