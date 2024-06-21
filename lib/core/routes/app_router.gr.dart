// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:student_lecture_app/infrastructure/common/dtos/article_model.dart'
    as _i14;
import 'package:student_lecture_app/presentation/pages/calculator_page/calculator_page.dart'
    as _i1;
import 'package:student_lecture_app/presentation/pages/counter_page/counter_page.dart'
    as _i2;
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/dummy_ui_step_1_page.dart'
    as _i3;
import 'package:student_lecture_app/presentation/pages/dummy_ui_page/dummy_ui_step_2_page.dart'
    as _i4;
import 'package:student_lecture_app/presentation/pages/input_validation_page/input_validation_page.dart'
    as _i5;
import 'package:student_lecture_app/presentation/pages/main_page.dart' as _i6;
import 'package:student_lecture_app/presentation/pages/news_page/most_popular_articles_page.dart'
    as _i7;
import 'package:student_lecture_app/presentation/pages/news_page/news_page.dart'
    as _i8;
import 'package:student_lecture_app/presentation/pages/news_page/top_stories_category_page.dart'
    as _i10;
import 'package:student_lecture_app/presentation/pages/news_page/top_stories_choose_category_page.dart'
    as _i11;
import 'package:student_lecture_app/presentation/pages/to_do_page/to_do_page.dart'
    as _i9;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    CalculatorRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalculatorPage(),
      );
    },
    CounterRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.CounterPage(),
      );
    },
    DummyUIStep1Route.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DummyUIStep1Page(),
      );
    },
    DummyUIStep2Route.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DummyUIStep2Page(),
      );
    },
    InputValidationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.InputValidationPage(),
      );
    },
    MainRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MainPage(),
      );
    },
    MostPopularArticlesRoute.name: (routeData) {
      final args = routeData.argsAs<MostPopularArticlesRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.MostPopularArticlesPage(
          key: args.key,
          articles: args.articles,
        ),
      );
    },
    NewsRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.NewsPage(),
      );
    },
    ToDoRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ToDoPage(),
      );
    },
    TopStoriesCategoryRoute.name: (routeData) {
      final args = routeData.argsAs<TopStoriesCategoryRouteArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.TopStoriesCategoryPage(
          key: args.key,
          title: args.title,
        ),
      );
    },
    TopStoriesChooseCategoryRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.TopStoriesChooseCategoryPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CalculatorPage]
class CalculatorRoute extends _i12.PageRouteInfo<void> {
  const CalculatorRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CalculatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalculatorRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CounterPage]
class CounterRoute extends _i12.PageRouteInfo<void> {
  const CounterRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DummyUIStep1Page]
class DummyUIStep1Route extends _i12.PageRouteInfo<void> {
  const DummyUIStep1Route({List<_i12.PageRouteInfo>? children})
      : super(
          DummyUIStep1Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep1Route';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DummyUIStep2Page]
class DummyUIStep2Route extends _i12.PageRouteInfo<void> {
  const DummyUIStep2Route({List<_i12.PageRouteInfo>? children})
      : super(
          DummyUIStep2Route.name,
          initialChildren: children,
        );

  static const String name = 'DummyUIStep2Route';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.InputValidationPage]
class InputValidationRoute extends _i12.PageRouteInfo<void> {
  const InputValidationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          InputValidationRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputValidationRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.MainPage]
class MainRoute extends _i12.PageRouteInfo<void> {
  const MainRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MostPopularArticlesPage]
class MostPopularArticlesRoute
    extends _i12.PageRouteInfo<MostPopularArticlesRouteArgs> {
  MostPopularArticlesRoute({
    _i13.Key? key,
    required List<_i14.ArticleModel> articles,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MostPopularArticlesRoute.name,
          args: MostPopularArticlesRouteArgs(
            key: key,
            articles: articles,
          ),
          initialChildren: children,
        );

  static const String name = 'MostPopularArticlesRoute';

  static const _i12.PageInfo<MostPopularArticlesRouteArgs> page =
      _i12.PageInfo<MostPopularArticlesRouteArgs>(name);
}

class MostPopularArticlesRouteArgs {
  const MostPopularArticlesRouteArgs({
    this.key,
    required this.articles,
  });

  final _i13.Key? key;

  final List<_i14.ArticleModel> articles;

  @override
  String toString() {
    return 'MostPopularArticlesRouteArgs{key: $key, articles: $articles}';
  }
}

/// generated route for
/// [_i8.NewsPage]
class NewsRoute extends _i12.PageRouteInfo<void> {
  const NewsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ToDoPage]
class ToDoRoute extends _i12.PageRouteInfo<void> {
  const ToDoRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ToDoRoute.name,
          initialChildren: children,
        );

  static const String name = 'ToDoRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TopStoriesCategoryPage]
class TopStoriesCategoryRoute
    extends _i12.PageRouteInfo<TopStoriesCategoryRouteArgs> {
  TopStoriesCategoryRoute({
    _i13.Key? key,
    required String title,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          TopStoriesCategoryRoute.name,
          args: TopStoriesCategoryRouteArgs(
            key: key,
            title: title,
          ),
          initialChildren: children,
        );

  static const String name = 'TopStoriesCategoryRoute';

  static const _i12.PageInfo<TopStoriesCategoryRouteArgs> page =
      _i12.PageInfo<TopStoriesCategoryRouteArgs>(name);
}

class TopStoriesCategoryRouteArgs {
  const TopStoriesCategoryRouteArgs({
    this.key,
    required this.title,
  });

  final _i13.Key? key;

  final String title;

  @override
  String toString() {
    return 'TopStoriesCategoryRouteArgs{key: $key, title: $title}';
  }
}

/// generated route for
/// [_i11.TopStoriesChooseCategoryPage]
class TopStoriesChooseCategoryRoute extends _i12.PageRouteInfo<void> {
  const TopStoriesChooseCategoryRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TopStoriesChooseCategoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'TopStoriesChooseCategoryRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
