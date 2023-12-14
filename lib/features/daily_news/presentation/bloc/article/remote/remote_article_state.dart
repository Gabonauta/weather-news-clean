import 'package:equatable/equatable.dart';
import 'package:weather/features/daily_news/data/models/article_model.dart';
import 'package:dio/dio.dart';

abstract class RemoteArticleState extends Equatable {
  final List<ArticleModel>? articles;

  final DioException? dioError;
  const RemoteArticleState({this.articles, this.dioError});

  @override
  List<Object> get props => [
        {articles, dioError}
      ];
}

class RemoteArticlesLoading extends RemoteArticleState {
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState {
  const RemoteArticlesDone(List<ArticleModel> article)
      : super(articles: article);
}

class RemoteArticlesError extends RemoteArticleState {
  const RemoteArticlesError(DioException error) : super(dioError: error);
}
