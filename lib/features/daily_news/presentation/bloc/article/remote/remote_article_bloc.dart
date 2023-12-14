import 'package:flutter_bloc/flutter_bloc.dart ';
import 'package:weather/core/resources/data_state.dart';
import 'package:weather/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:weather/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';

import '../../../../domain/usecases/get_article_usecase.dart';

class RemoteArticlesBloc
    extends Bloc<RemoteArcticlesEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();
    if (dataState is DataSuccess && dataState.data != null) {
      emit(RemoteArticlesDone(dataState.data!));
    } else if (dataState is DataError) {
      print(dataState.error!.message!);
      emit(RemoteArticlesError(dataState.error!));
    }
  }
}
