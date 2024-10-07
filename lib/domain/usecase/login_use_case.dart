import 'package:ecommerce_app/data/model/requests/login_request.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/authintication.dart';
import 'package:ecommerce_app/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<Result<Authintication?>> call(LoginRequest loginRequest) async {
    return await authRepo.login(loginRequest);
  }
}
