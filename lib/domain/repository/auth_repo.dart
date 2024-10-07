import 'package:ecommerce_app/data/model/requests/login_request.dart';
import 'package:ecommerce_app/domain/Result.dart';

import '../model/authintication.dart';

abstract class AuthRepo {
  Future<Result<Authintication?>> login(LoginRequest loginRequest);
}
