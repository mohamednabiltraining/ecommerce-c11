import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Product.dart';

abstract class ProductsOnlineDataSource{
  Future<Result<List<Product>?>> getProducts({String? subcategory, String? category, String?brand});
}