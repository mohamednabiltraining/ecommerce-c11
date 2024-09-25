import 'package:ecommerce_app/data/ApiManager.dart';
import 'package:ecommerce_app/data/datasource/CategoriesOnlineDataSource.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Category.dart';

@Injectable(as: CategoriesOnlineDataSource)
class CategoriesOnlineDataSourceImpl implements
    CategoriesOnlineDataSource{
  ApiManager apiManager;
  // constructor injection
  @factoryMethod
  CategoriesOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Category>?>> getCategories()async{
    var result = await apiManager.loadCategories();

    switch (result) {
      case Success() : {
        var convertedList = result.data?.map((catDto)=> catDto.toCategory()).toList();
        return Success(data: convertedList);
      }
      case ServerError():{
        return ServerError(result.exception);
      }
      case Error():{
        return Error(result.exception);
      }
    }

  }


}