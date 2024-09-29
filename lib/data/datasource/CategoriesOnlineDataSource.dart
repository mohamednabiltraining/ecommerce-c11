import 'package:ecommerce_app/data/model/responses/CategoryDto.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/model/SubCategory.dart';

abstract class CategoriesOnlineDataSource{
  Future<Result<List<Category>?>> getCategories();
  Future<Result<List<Subcategory>?>> getSubCategories(String catId);
}