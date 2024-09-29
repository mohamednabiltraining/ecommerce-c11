import 'package:ecommerce_app/data/datasource/CategoriesOnlineDataSource.dart';

import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/SubCategory.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/CategoriesRepository.dart';

@Injectable(as: CategoriesRepository )
class CategoriesRepositoryImpl implements CategoriesRepository{
  CategoriesOnlineDataSource dataSource;
  @factoryMethod
  CategoriesRepositoryImpl(this.dataSource);
  @override
  Future<Result<List<Category>?>> getCategories() {
   return dataSource.getCategories();
  }

  @override
  Future<Result<List<Subcategory>?>> getSubCategories(String catId) {
    return dataSource.getSubCategories(catId);
  }


}