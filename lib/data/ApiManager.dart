import 'package:dio/dio.dart';
import 'package:ecommerce_app/data/extentsions.dart';
import 'package:ecommerce_app/data/model/responses/BrandDto.dart';
import 'package:ecommerce_app/data/model/responses/CategoryDto.dart';
import 'package:ecommerce_app/data/model/responses/ErrorResponse.dart';
import 'package:ecommerce_app/data/model/responses/SubCategoryDto.dart';
import 'package:ecommerce_app/data/model/responses/brands/BrandsResponse.dart';
import 'package:ecommerce_app/data/model/responses/categories/CategoriesResponse.dart';
import 'package:ecommerce_app/data/model/responses/categories/SubCategoriesResponse.dart';
import 'package:ecommerce_app/data/model/responses/products/ProductDto.dart';
import 'package:ecommerce_app/data/model/responses/products/ProductsResponse.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager{

   final dio = Dio();
   // http
   ApiManager(){
     dio.interceptors.add(LogInterceptor(
       requestBody: true,
       responseBody: true,
       logPrint: (object) {
        debugPrint(object.toString());
       },
     ));
   }

    static String baseUrl = "https://ecommerce.routemisr.com/";
    static String categoriesEndpoint = "${baseUrl}api/v1/categories";
    static String brandsEndpoint = "${baseUrl}api/v1/brands";
    static String subCategoriesEndpoint = "${baseUrl}api/v1/categories/";
    static String productsEndpoint = "${baseUrl}api/v1/products";

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

   Future<Result<List<SubCategoryDto>?>> getSubCategories(String categoryId)async{

     try{
       var response  = await dio.get("$subCategoriesEndpoint$categoryId/subcategories");
       var subCategoriesResponse = SubCategoriesResponse.fromJson(response.data);
       if(response.statusCode?.isSuccessCall() == true){
         return Success(data: subCategoriesResponse.data);
       }
       var errorResponse = ErrorResponse.fromJson(response.data);

       return ServerError(
           ServerErrorException(errorResponse.statusMsg , errorResponse.message)
       );

     }on Exception catch (ex){
       return Error(ex);
     }
   }

   Future<Result<List<ProductDto>?>> getProducts({String? subcategory, String? category, String? brand})async{
     try{

     Map<String,dynamic> params = {};
     if(subcategory!=null){
       params["subcategory"] = subcategory;
     }
     if(category!=null){
       params["category"] = category;
     }
      if(brand!=null){
       params["brand"] = brand;
     }
       var response  = await dio.get(productsEndpoint,
       queryParameters: params);
       var productsResponse = ProductsResponse.fromJson(response.data);
       if(response.statusCode?.isSuccessCall() == true){
         return Success(data: productsResponse.data);
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