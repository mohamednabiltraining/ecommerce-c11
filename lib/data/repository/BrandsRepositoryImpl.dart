import 'package:ecommerce_app/data/datasource/BrandsOnlineDataSource.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/Brand.dart';
import 'package:ecommerce_app/domain/repository/BrandsRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepoImpl implements BrandsRepository{

  BrandsOnlineDataSource brandsOnlineDataSource;
  BrandsRepoImpl(this.brandsOnlineDataSource);

  @override
  Future<Result<List<Brand>?>> getBrands() {
    return brandsOnlineDataSource.getBrands();
  }



}