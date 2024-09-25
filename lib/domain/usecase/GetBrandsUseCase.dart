import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/repository/BrandsRepository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase{
  BrandsRepository repository;

  GetBrandsUseCase(this.repository);

  Future<Result<List<Brand>?>> invoke(){
    return repository.getBrands();
  }
}