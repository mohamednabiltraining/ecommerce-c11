import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';

abstract class CategoriesRepository{
  Future<Result<List<Category>?>> getCategories();
}