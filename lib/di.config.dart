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
import 'data/datasource/CategoriesOnlineDataSource.dart' as _i993;
import 'data/datasourceImpl/CategoriesOnlineDatasourceImpl.dart' as _i686;
import 'data/repository/CategoriesRepositoryImpl.dart' as _i914;
import 'domain/repository/CategoriesRepository.dart' as _i293;
import 'presentation/features/main_layout/home/presentation/HomeViewModel.dart'
    as _i969;

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
    gh.factory<_i993.CategoriesOnlineDataSource>(
        () => _i686.CategoriesOnlineDataSourceImpl(gh<_i88.ApiManager>()));
    gh.factory<_i293.CategoriesRepository>(() =>
        _i914.CategoriesRepositoryImpl(gh<_i993.CategoriesOnlineDataSource>()));
    gh.factory<_i969.HomeViewModel>(
        () => _i969.HomeViewModel(gh<_i293.CategoriesRepository>()));
    return this;
  }
}
