
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/SubCategory.dart';
import 'package:ecommerce_app/domain/repository/CategoriesRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoriesUseCase{
  CategoriesRepository repository;
  GetSubCategoriesUseCase(this.repository);
  
  Future<Result<List<Subcategory>?>> invoke(String catId){
    return repository.getSubCategories(catId);
  }
}