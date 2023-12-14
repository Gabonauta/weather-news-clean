import 'package:weather/core/resources/data_state.dart';
import 'package:weather/core/usecases/usecase.dart';
import 'package:weather/features/daily_news/data/models/article_model.dart';
import 'package:weather/features/daily_news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleModel>>, void>{
  final ArticleRepository _articleRepository;
  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleModel>>> call({params}) {
    return _articleRepository.getArticles();
  }
}