import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weather/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:weather/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:weather/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:weather/features/daily_news/domain/repository/article_repository.dart';
import 'package:weather/features/daily_news/domain/usecases/get_article_usecase.dart';
import 'package:weather/features/daily_news/domain/usecases/get_saved_article_usecase.dart';
import 'package:weather/features/daily_news/domain/usecases/remove_article_usecase.dart';
import 'package:weather/features/daily_news/domain/usecases/save_article_usecase.dart';
import 'package:weather/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:weather/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  final database =
      await $FloorAppDataBase.databaseBuilder('app_database.dart').build();
  sl.registerSingleton<AppDataBase>(database);
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(
    NewsApiService(
      sl(),
    ),
  );
  sl.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(
      sl(),
      sl(),
    ),
  );

  //usecases
  sl.registerSingleton(
    GetArticleUseCase(
      sl(),
    ),
  );

  sl.registerSingleton<GetSavedArticlesUseCase>(
    GetSavedArticlesUseCase(
      sl(),
    ),
  );

  sl.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(
      sl(),
    ),
  );

  sl.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(
      sl(),
    ),
  );

  //blocs
  sl.registerFactory<RemoteArticlesBloc>(
    () => RemoteArticlesBloc(
      sl(),
    ),
  );
  sl.registerFactory(
    () => LocalArticleBloc(
      sl(),
      sl(),
      sl(),
    ),
  );
}
