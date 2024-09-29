import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/SubCategory.dart';
import 'package:ecommerce_app/domain/usecase/categories/GetSubCategoriesUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubCategoriesViewModel extends Cubit<SubCategoriesState>{
  GetSubCategoriesUseCase subCategoriesUseCase;
  SubCategoriesViewModel(this.subCategoriesUseCase):super(LoadingState());

  void loadSubCategories(catId) async{
    emit(LoadingState());
    var result = await subCategoriesUseCase.invoke(catId);

    switch (result) {

      case Success<List<Subcategory>?>():{
        emit(SuccessState(result.data?? []));
      }
      case ServerError<List<Subcategory>?>():{
        emit(ErrorState(result.exception));
      }
      case Error<List<Subcategory>?>():
        emit(ErrorState(result.exception));
    }
  }

}

sealed class SubCategoriesState{}

class LoadingState extends SubCategoriesState{}
class ErrorState extends SubCategoriesState{
  Exception? exception;
  ErrorState(this.exception);
}
class SuccessState extends SubCategoriesState{
  List<Subcategory> subCategories;
  SuccessState(this.subCategories);
}
