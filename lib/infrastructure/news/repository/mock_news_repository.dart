import 'package:fpdart/fpdart.dart';
import 'package:student_lecture_app/domain/core/app_failure.dart';
import 'package:student_lecture_app/domain/news/i_news_repository.dart';
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart';

// @LazySingleton(as: INewsRepository)
class MockNewsRepository implements INewsRepository {
  @override
  Future<Either<AppFailure, List<ArticleModel>>> getMostPopular() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final articles = [
        ArticleModel(id: '1', title: 'Mock Article', byline: 'Lintang', multimedia: [], publishedDate: '2024-03-20'),
      ];
      return right(articles);
    } catch (e) {
      return left(AppFailure.fromServerSide(e.toString()));
    }
  }

  @override
  Future<Either<AppFailure, List<ArticleModel>>> getTopStories(String section) {
    // TODO: implement getTopStories
    throw UnimplementedError();
  }
}
