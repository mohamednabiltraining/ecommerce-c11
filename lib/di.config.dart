// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'data/ApiManager.dart' as _i88;
import 'data/datasource/BrandsOnlineDataSource.dart' as _i857;
import 'data/datasource/CategoriesOnlineDataSource.dart' as _i993;
import 'data/datasourceImpl/BrandsOnlineDatasourceImpl.dart' as _i562;
import 'data/datasourceImpl/CategoriesOnlineDatasourceImpl.dart' as _i686;
import 'data/repository/BrandsRepositoryImpl.dart' as _i48;
import 'data/repository/CategoriesRepositoryImpl.dart' as _i914;
import 'domain/repository/BrandsRepository.dart' as _i672;
import 'domain/repository/CategoriesRepository.dart' as _i293;
import 'domain/usecase/categories/GetMostCommonCategories.dart' as _i1057;
import 'domain/usecase/GetBrandsUseCase.dart' as _i262;
import 'presentation/features/main_layout/CategoriesViewModel.dart' as _i389;
import 'presentation/features/main_layout/home/presentation/BrandsViewModel.dart'
    as _i492;
import 'presentation/features/main_layout/home/presentation/CategoriesViewModel.dart'
    as _i413;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i88.ApiManager>(() => _i88.ApiManager());
    gh.factory<_i857.BrandsOnlineDataSource>(
        () => _i562.BrandsOnlineDatasourceImpl(gh<_i88.ApiManager>()));
    gh.factory<_i993.CategoriesOnlineDataSource>(
        () => _i686.CategoriesOnlineDataSourceImpl(gh<_i88.ApiManager>()));
    gh.factory<_i672.BrandsRepository>(
        () => _i48.BrandsRepoImpl(gh<_i857.BrandsOnlineDataSource>()));
    gh.factory<_i293.CategoriesRepository>(() =>
        _i914.CategoriesRepositoryImpl(gh<_i993.CategoriesOnlineDataSource>()));
    gh.factory<_i262.GetBrandsUseCase>(
        () => _i262.GetBrandsUseCase(gh<_i672.BrandsRepository>()));
    gh.factory<_i492.BrandsViewModel>(
        () => _i492.BrandsViewModel(gh<_i262.GetBrandsUseCase>()));
    gh.factory<_i1057.GetMostCommonCategories>(
        () => _i1057.GetMostCommonCategories(gh<_i293.CategoriesRepository>()));
    gh.factory<_i413.CategoriesViewModel>(
        () => _i413.CategoriesViewModel(gh<_i1057.GetMostCommonCategories>()));
    gh.factory<_i389.CategoriesViewModel>(
        () => _i389.CategoriesViewModel(gh<_i1057.GetMostCommonCategories>()));
    return this;
  }
}
