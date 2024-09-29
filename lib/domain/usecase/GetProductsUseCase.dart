import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Product.dart';
import 'package:ecommerce_app/domain/repository/ProductsRepo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductsUseCase{
  ProductsRepo productsRepo;
  GetProductsUseCase(this.productsRepo);

  Future<Result<List<Product>?>>invoke({String? brand,
  String? category,
  String? subCategory}
      ){
    return productsRepo.getProducts(
      brand: brand,
      category: category,
      subcategory: subCategory
    );

  }
}