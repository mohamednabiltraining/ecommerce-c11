import 'package:ecommerce_app/data/ApiManager.dart';
import 'package:ecommerce_app/data/datasource/auth_data_source.dart';
import 'package:ecommerce_app/data/model/requests/login_request.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/authintication.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;
  // constructor injection
  @factoryMethod
  AuthDataSourceImpl(this.apiManager);

  @override
  Future<Result<Authintication>> login(LoginRequest loginRequest) async {
    var result = await apiManager.login(loginRequest);

    switch (result) {
      case Success():
        {
          return Success(data: result.data.toDomain());
        }
      case ServerError():
        {
          return ServerError(result.exception);
        }
      case Error():
        {
          return Error(result.exception);
        }
    }
  }
}
