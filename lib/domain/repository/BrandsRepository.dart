import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';

abstract class BrandsRepository{
  Future<Result<List<Brand>?>> getBrands();
}