// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:student_lecture_app/application/most_popular_articles_cubit/most_popular_articles_cubit.dart'
    as _i11;
import 'package:student_lecture_app/core/env/env.dart' as _i4;
import 'package:student_lecture_app/core/routes/app_router.dart' as _i3;
import 'package:student_lecture_app/core/utils/register_module.dart' as _i12;
import 'package:student_lecture_app/domain/news/i_news_repository.dart' as _i9;
import 'package:student_lecture_app/infrastructure/core/api_helper.dart' as _i7;
import 'package:student_lecture_app/infrastructure/news/data_source/news_data_source.dart'
    as _i8;
import 'package:student_lecture_app/infrastructure/news/repository/news_repository.dart'
    as _i10;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AppRouter>(registerModule.appRouter);
    gh.factory<_i4.Env>(() => _i4.Env());
    gh.lazySingleton<_i5.Logger>(() => registerModule.logger);
    gh.lazySingleton<_i6.Dio>(() => registerModule.dio(gh<_i4.Env>()));
    gh.lazySingleton<_i7.ApiHelper>(() => _i7.ApiHelper(gh<_i6.Dio>()));
    gh.factory<_i8.NewsDataSource>(
        () => _i8.NewsDataSource(gh<_i7.ApiHelper>()));
    gh.lazySingleton<_i9.INewsRepository>(
        () => _i10.NewsRepository(gh<_i8.NewsDataSource>()));
    gh.factory<_i11.MostPopularArticlesCubit>(
        () => _i11.MostPopularArticlesCubit(gh<_i9.INewsRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i12.RegisterModule {}
