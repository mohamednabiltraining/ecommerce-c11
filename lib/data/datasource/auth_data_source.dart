import 'package:ecommerce_app/data/model/requests/login_request.dart';
import 'package:ecommerce_app/data/model/requests/register_request.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/authintication.dart';

abstract class AuthDataSource {
  Future<Result<Authintication>> login(LoginRequest loginRequest);
  Future<Result<Authintication>> register(RegisterRequest registerRequest);
}
