import 'package:ecommerce_app/data/model/responses/Category.dart';
import 'package:ecommerce_app/domain/Result.dart';

abstract class CategoriesRepository{
  Future<Result<List<Category>?>> getCategories();
}