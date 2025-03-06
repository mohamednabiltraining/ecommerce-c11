import 'package:ecommerce_app/data/datasource/auth_data_source.dart';
import 'package:ecommerce_app/data/model/requests/login_request.dart';
import 'package:ecommerce_app/data/model/requests/register_request.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/authintication.dart';
import 'package:ecommerce_app/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthDataSource authDataSource;

  AuthRepoImpl({required this.authDataSource});

  @override
  Future<Result<Authintication?>> login(LoginRequest loginRequest) {
    return authDataSource.login(loginRequest);
  }

  @override
  Future<Result<Authintication?>> register(RegisterRequest registerRequest) {
    return authDataSource.register(registerRequest);
  }
}
