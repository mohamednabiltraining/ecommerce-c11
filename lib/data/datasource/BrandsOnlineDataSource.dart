import 'package:ecommerce_app/data/model/responses/CategoryDto.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/model/Category.dart';

abstract class BrandsOnlineDataSource{
  Future<Result<List<Brand>?>> getBrands();
}