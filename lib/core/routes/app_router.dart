import 'package:auto_route/auto_route.dart';
import 'package:student_lecture_app/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> routes = [
    AutoRoute(page: MainRoute.page, initial: true),
    AutoRoute(page: DummyUIStep1Route.page),
    AutoRoute(page: DummyUIStep2Route.page),
    AutoRoute(page: CounterRoute.page),
    AutoRoute(page: InputValidationRoute.page),
    AutoRoute(page: CalculatorRoute.page),
    AutoRoute(page: ToDoRoute.page),
    AutoRoute(page: NewsRoute.page),
    AutoRoute(page: TopStoriesChooseCategoryRoute.page),
    AutoRoute(page: TopStoriesCategoryRoute.page),
    AutoRoute(page: MostPopularArticlesRoute.page),
  ];
}
