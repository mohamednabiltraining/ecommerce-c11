import 'package:ecommerce_app/data/ApiManager.dart';
import 'package:ecommerce_app/data/datasource/BrandsOnlineDataSource.dart';
import 'package:ecommerce_app/data/datasource/CategoriesOnlineDataSource.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:injectable/injectable.dart';

import '../../domain/model/Category.dart';

@Injectable(as: BrandsOnlineDataSource)
class BrandsOnlineDatasourceImpl implements
    BrandsOnlineDataSource{
  ApiManager apiManager;
  // constructor injection
  @factoryMethod
  BrandsOnlineDatasourceImpl(this.apiManager);

  @override
  Future<Result<List<Brand>?>> getBrands() async{
    var result = await apiManager.loadBrands();

    switch (result) {
      case Success() : {
        var convertedList = result.data?.map((brandDto)=> brandDto.toBrand()).toList();
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