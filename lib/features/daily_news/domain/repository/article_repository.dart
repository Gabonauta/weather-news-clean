import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/daily_news/data/models/article_model.dart';
import 'package:weather/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  //API methods
  Future<DataState<List<ArticleModel>>> getArticles();

  //Database methods
  Future<List<ArticleModel>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
