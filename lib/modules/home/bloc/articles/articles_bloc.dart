import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elisoft_flutter_test/models/article.dart';
import 'package:elisoft_flutter_test/repositories/articles_repository.dart';
import 'package:equatable/equatable.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(const ArticleState()) {
    on<LoadArticles>(_onLoadArticles);
  }

  final articleRepo = ArticleRepository();

  Future<void> _onLoadArticles(
    LoadArticles event,
    Emitter<ArticleState> emit,
  ) async {
    if (event.fresh) {
      emit(state.copy(status: ArticleStatus.initial, data: []));
    }

    try {
      final resp = await articleRepo.getArticles(
        offset: state.data.length,
      );

      if (state.status == ArticleStatus.initial) {
        emit(state.copy(status: ArticleStatus.refreshComplete));
      }

      if (resp != null) {
        if (resp.isNotEmpty) {
          final contents = List.of(state.data)..addAll(resp);
          if (resp.length < 10) {
            emit(state.copy(status: ArticleStatus.stopLoadMore));
          }
          emit(state.copy(status: ArticleStatus.loadComplete));
          emit(state.copy(status: ArticleStatus.success, data: contents));
        } else {
          emit(state.copy(status: ArticleStatus.stopLoadMore));
          emit(state.copy(status: ArticleStatus.loadComplete));
        }

        if (state.data.isEmpty) {
          emit(state.copy(status: ArticleStatus.empty));
        }
      }
    } catch (e) {
      log('message ::: error : $e');
      emit(state.copy(status: ArticleStatus.failure));
    }
  }
}
