import 'package:ecommerce_app/data/model/requests/register_request.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/model/authintication.dart';
import 'package:ecommerce_app/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterUseCase {
  final AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  Future<Result<Authintication?>> call(RegisterRequest registerRequest) {
    return authRepo.register(registerRequest);
  }
}
