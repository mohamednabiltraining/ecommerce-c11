import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/usecase/categories/GetMostCommonCategories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesState>{
  GetMostCommonCategories getMostCommonCategoriesUseCase;
  CategoriesViewModel(this.getMostCommonCategoriesUseCase):super(CategoriesLoadingState());



  void loadCategories()async{
    emit(CategoriesLoadingState());
    // call api
    var result = await getMostCommonCategoriesUseCase.invoke();
    switch(result){
      case Success():{
        emit(CategoriesLoadedState(result.data));
      }
      case Error():{
        emit(CategoriesErrorState( result.exception));
      }
      case ServerError():
       emit(CategoriesErrorState( result.exception));
    }
    // send data to view
  }

}

sealed class CategoriesState{}

class CategoriesLoadedState extends CategoriesState{
  List<Category>? categories;
  CategoriesLoadedState(this.categories);
}
class CategoriesLoadingState extends CategoriesState{}
class CategoriesErrorState extends CategoriesState{
  Exception? exception;
  CategoriesErrorState(this.exception);
}