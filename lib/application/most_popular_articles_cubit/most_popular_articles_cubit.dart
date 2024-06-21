import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/domain/news/i_news_repository.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';

part 'most_popular_articles_cubit.freezed.dart';
part 'most_popular_articles_state.dart';

@injectable
class MostPopularArticlesCubit extends Cubit<MostPopularArticlesState> {
  final INewsRepository _newsRepository;
  MostPopularArticlesCubit(this._newsRepository) : super(MostPopularArticlesState.initial()) {
    getMostPopular();
  }

  void getMostPopular() async {
    emit(state.unmodified.copyWith(isLoading: true));
    final response = await _newsRepository.getMostPopular();
    emit(state.unmodified.copyWith(failureOrSucceedArticles: optionOf(response)));
  }
}
