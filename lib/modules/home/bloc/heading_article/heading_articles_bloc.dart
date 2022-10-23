import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elisoft_flutter_test/models/article.dart';
import 'package:elisoft_flutter_test/repositories/articles_repository.dart';
import 'package:equatable/equatable.dart';

part 'heading_articles_event.dart';
part 'heading_articles_state.dart';

class HeadingArticleBloc
    extends Bloc<HeadingArticleEvent, HeadingArticleState> {
  HeadingArticleBloc() : super(const HeadingArticleState()) {
    on<LoadHeadingArticles>(_onLoadHeadingArticles);
  }

  final articleRepo = ArticleRepository();

  Future<void> _onLoadHeadingArticles(
    LoadHeadingArticles event,
    Emitter<HeadingArticleState> emit,
  ) async {
    if (event.fresh) {
      emit(state.copy(status: HeadingArticleStatus.initial, data: []));
    }

    try {
      final resp = await articleRepo.getHeadingArticles(
        offset: state.data.length,
      );

      if (state.status == HeadingArticleStatus.initial) {
        emit(state.copy(status: HeadingArticleStatus.refreshComplete));
      }

      if (resp != null) {
        if (resp.isNotEmpty) {
          final contents = List.of(state.data)..addAll(resp);
          if (resp.length < 10) {
            emit(state.copy(status: HeadingArticleStatus.stopLoadMore));
          }
          emit(state.copy(status: HeadingArticleStatus.loadComplete));
          emit(
              state.copy(status: HeadingArticleStatus.success, data: contents));
        } else {
          emit(state.copy(status: HeadingArticleStatus.stopLoadMore));
          emit(state.copy(status: HeadingArticleStatus.loadComplete));
        }

        if (state.data.isEmpty) {
          emit(state.copy(status: HeadingArticleStatus.empty));
        }
      }
    } catch (e) {
      log('message ::: error : $e');
      emit(state.copy(status: HeadingArticleStatus.failure));
    }
  }
}
