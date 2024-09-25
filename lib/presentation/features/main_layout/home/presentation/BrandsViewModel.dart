import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/usecase/GetBrandsUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsViewModel extends Cubit<BrandsState>{
  GetBrandsUseCase getBrandsUseCase;
  BrandsViewModel(this.getBrandsUseCase):super(BrandsLoadingState());



  void loadBrands()async{
    emit(BrandsLoadingState());
    // call api
    var result = await getBrandsUseCase.invoke();
    switch(result){
      case Success():{
        emit(BrandsLoadedState(result.data));
      }
      case Error():{
        emit(BrandsErrorState(result.exception));
      }
      case ServerError():
       emit(BrandsErrorState(result.exception));
    }
    // send data to view
  }

}

sealed class BrandsState{}
class BrandsLoadedState extends BrandsState{
  List<Brand>? brands;
  BrandsLoadedState(this.brands);
}
class BrandsLoadingState extends BrandsState {}
class BrandsErrorState extends BrandsState{
  Exception? exception;
  BrandsErrorState(this.exception);
}