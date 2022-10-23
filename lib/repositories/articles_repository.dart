import 'dart:async';
import 'dart:developer';

import 'package:elisoft_flutter_test/api/app_api.dart';
import 'package:elisoft_flutter_test/exception/app_exception.dart';
import 'package:elisoft_flutter_test/models/article.dart';
import 'package:elisoft_flutter_test/models/base_response.dart';

class ArticleRepository {
  ArticleRepository();

  Future<List<Article>?> getHeadingArticles({int offset = 0}) async {
    try {
      final result = await PublicApi.get('/articles');

      final resp = BaseResponseApp.fromJson(result);
      if (resp.status) {
        final contents = (resp.data as List)
            .map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList();

        return contents;
      }
      return null;
    } on AppException catch (e) {
      throw AppException(message: e.message);
    } catch (e) {
      log('message :: error getPrograms : $e');
      throw AppException(message: e.toString());
    }
  }

  Future<List<Article>?> getArticles({int offset = 0}) async {
    try {
      final result = await PublicApi.get('/articles');

      final resp = BaseResponseApp.fromJson(result);
      if (resp.status) {
        final contents = (resp.data as List)
            .map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList();

        return contents;
      }
      return null;
    } on AppException catch (e) {
      throw AppException(message: e.message);
    } catch (e) {
      log('message :: error getPrograms : $e');
      throw AppException(message: e.toString());
    }
  }
}
