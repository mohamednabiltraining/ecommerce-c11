import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Product.dart';
import 'package:ecommerce_app/domain/usecase/GetProductsUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsState>{
  GetProductsUseCase productsUseCase;

  ProductsViewModel(this.productsUseCase):super(LoadingState());

  void loadProducts({String? brand, String? category, String? subCategory})async{
    emit(LoadingState());
    var result = await productsUseCase.invoke(brand: brand,
        category: category,
        subCategory: subCategory);

    switch (result) {

      case Success<List<Product>?>():{
        emit(ProductsLoaded(result.data));
      }
      case ServerError<List<Product>?>():{
        emit(ErrorState(result.exception));
      }
      case Error<List<Product>?>():
        emit(ErrorState(result.exception));
    }
  }
}
sealed class ProductsState{}
class ProductsLoaded extends ProductsState{
  List<Product>? products;
  ProductsLoaded(this.products);
}
class LoadingState extends ProductsState{}
class ErrorState extends ProductsState{
  Exception? exception;
  ErrorState(this.exception);
}