part of 'most_popular_articles_cubit.dart';

@freezed
class MostPopularArticlesState with _$MostPopularArticlesState {
  const MostPopularArticlesState._();
  const factory MostPopularArticlesState({
    required Option<Either<AppFailure, List<ArticleModel>>> failureOrSucceedArticles,
    required bool isLoading,
  }) = _MostPopularArticlesState;

  factory MostPopularArticlesState.initial() => MostPopularArticlesState(
        failureOrSucceedArticles: none(),
        isLoading: false,
      );

  MostPopularArticlesState get unmodified => copyWith(
        isLoading: false,
        failureOrSucceedArticles: none(),
      );
}
