import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Category.dart';
import 'package:ecommerce_app/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetMostCommonCategories{
  CategoriesRepository categoriesRepository;
  GetMostCommonCategories(this.categoriesRepository);

  Future<Result<List<Category>?>> invoke([int limit = 10])async{
    var result = await categoriesRepository.getCategories();
   switch (result) {
     case Success(): {
       var newResult  = result.data?.take(limit);
       return Success(data: newResult?.toList());
     }
     default:{
       return result;
     }
   }
  }

}