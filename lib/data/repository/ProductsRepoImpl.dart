import 'package:ecommerce_app/data/datasource/ProductsOnlineDataSource.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Product.dart';
import 'package:ecommerce_app/domain/repository/ProductsRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo{
  ProductsOnlineDataSource onlineDataSource;
  ProductsRepoImpl(this.onlineDataSource);
  @override
  Future<Result<List<Product>?>> getProducts({String? subcategory, String? category, String?brand}) {
    return onlineDataSource.getProducts(
      category: category,
      subcategory: subcategory,
      brand: brand
    );
  }

}