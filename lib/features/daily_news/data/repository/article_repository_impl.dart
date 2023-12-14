import 'package:weather/core/constants.dart/constants.dart';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:weather/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:weather/features/daily_news/data/models/article_model.dart';
import 'package:weather/features/daily_news/domain/entities/article.dart';
import 'package:weather/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDataBase _appDataBase;
  ArticleRepositoryImpl(this._newsApiService, this._appDataBase);

  @override
  Future<DataState<List<ArticleModel>>> getArticles() async {
    try {
      final reponse = await _newsApiService.getArticles(
        apiKey: newsApiKey,
        country: country,
      );
      if (reponse.response.statusCode == 200) {
        return DataSuccess(reponse.data);
      } else {
        return DataError(reponse.response.data);
      }
    } catch (e) {
      return DataError(
        DioException(
          error: e.toString(),
          requestOptions: RequestOptions(
            path: "/top-headlines",
          ),
        ),
      );
    }
  }

  @override
  Future<List<ArticleModel>> getSavedArticles() {
    return _appDataBase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDataBase.articleDao
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDataBase.articleDao
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
