import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/extentsions.dart';
import 'package:ecommerce_app/data/model/responses/BrandDto.dart';
import 'package:ecommerce_app/data/model/responses/CategoryDto.dart';
import 'package:ecommerce_app/data/model/responses/ErrorResponse.dart';
import 'package:ecommerce_app/data/model/responses/brands/BrandsResponse.dart';
import 'package:ecommerce_app/data/model/responses/categories/CategoriesResponse.dart';
import 'package:ecommerce_app/data/repository/BrandsRepositoryImpl.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{

   final dio = Dio();
   // http

    static String baseUrl = "https://ecommerce.routemisr.com/";
    static String categoriesEndpoint = "${baseUrl}api/v1/categories";
    static String brandsEndpoint = "${baseUrl}api/v1/brands";


   Future<Result<List<CategoryDto>?>> loadCategories()async{



    try{
      var response  = await dio.get(categoriesEndpoint);
      var categoriesResponse = CategoriesResponse.fromJson(response.data);
      if(response.statusCode?.isSuccessCall() == true){
        return Success(data: categoriesResponse.data);
      }
      var errorResponse = ErrorResponse.fromJson(response.data);

      return ServerError(
          ServerErrorException(errorResponse.statusMsg , errorResponse.message)
      );

    }on Exception catch (ex){
      return Error(ex);
    }
  }

  Future<Result<List<BrandDto>?>> loadBrands()async{


    try{
      var response  = await dio.get(brandsEndpoint);
      var brandsResponse = BrandsResponse.fromJson(response.data);

      if(response.statusCode?.isSuccessCall() == true){
        return Success(data: brandsResponse.data);
      }
      var errorResponse = ErrorResponse.fromJson(response.data);

      return ServerError(
          ServerErrorException(errorResponse.statusMsg , errorResponse.message)
      );

    }on Exception catch (ex){
      return Error(ex);
    }

  }

}