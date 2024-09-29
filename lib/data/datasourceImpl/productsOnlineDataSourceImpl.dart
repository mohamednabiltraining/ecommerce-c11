import 'package:ecommerce_app/data/ApiManager.dart';
import 'package:ecommerce_app/data/datasource/ProductsOnlineDataSource.dart';
import 'package:ecommerce_app/data/model/responses/products/ProductDto.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Product.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsOnlineDataSource)
class ProductsOnlineDataSourceImpl implements ProductsOnlineDataSource{
  ApiManager apiManager;
  ProductsOnlineDataSourceImpl(this.apiManager);
  @override
  Future<Result<List<Product>?>> getProducts({String? subcategory, String? category, String? brand})async {
    var result = await apiManager.getProducts(category: category,
    subcategory: subcategory,
    brand: brand);

    switch (result) {
      case Success<List<ProductDto>?>():{
        var productsList = result.data?.map((productDto) => productDto.convertToProduct() ,).toList();
        return Success(data: productsList);
      }
      case ServerError<List<ProductDto>?>():{
        return ServerError(result.exception);
    }
      case Error<List<ProductDto>?>():{
        return Error(result.exception);
      }
    }
  }

}