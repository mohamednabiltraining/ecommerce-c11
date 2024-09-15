import 'package:ecommerce_app/data/model/responses/Category.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/repository/CategoriesRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState>{
  CategoriesRepository categoriesRepo;
  HomeViewModel(this.categoriesRepo):super(LoadingState());



  void loadHomeScreen()async{
    emit(LoadingState());
    // call api
    var result = await categoriesRepo.getCategories();
    switch(result){
      case Success():{
        emit(SuccessState(result.data));
      }
      case Error():{
        emit(ErrorState(result.exception));
      }
      case ServerError<List<Category>?>():
       emit(ErrorState(result.exception));
    }
    // send data to view
  }
}

sealed class HomeState{}
class LoadingState extends HomeState{}
class SuccessState extends HomeState{
  List<Category>? categories;
  SuccessState(this.categories);
}
class ErrorState extends HomeState{
  Exception? exception;
  ErrorState(this.exception);
}