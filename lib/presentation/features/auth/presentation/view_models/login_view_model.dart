import 'package:ecommerce_app/data/model/requests/login_request.dart';
import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/usecase/login_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginState> {
  LoginUseCase loginUseCase;
  LoginViewModel(this.loginUseCase) : super(LoginLoadingState());

  void login(LoginRequest loginRequest) async {
    emit(LoginLoadingState());
    // call api
    var result = await loginUseCase.call(loginRequest);
    switch (result) {
      case Success():
        {
          emit(LoginSuccessState());
        }
      case Error():
        {
          emit(LoginErrorState(result.exception));
        }
      case ServerError():
        emit(LoginErrorState(result.exception));
    }
    // send data to view
  }
}

sealed class LoginState {}

class LoginSuccessState extends LoginState {
  LoginSuccessState();
}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  Exception? exception;
  LoginErrorState(this.exception);
}
