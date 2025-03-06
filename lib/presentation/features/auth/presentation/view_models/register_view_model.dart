import 'package:ecommerce_app/domain/Result.dart';
import 'package:ecommerce_app/domain/usecase/register_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/model/requests/register_request.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterState> {
  RegisterUseCase registerUseCase;
  RegisterViewModel(this.registerUseCase) : super(RegisterLoadingState());

  void register(RegisterRequest registerRequest) async {
    emit(RegisterLoadingState());
    // call api
    var result = await registerUseCase(registerRequest);
    switch (result) {
      case Success():
        {
          emit(RegisterSuccessState());
        }
      case Error():
        {
          emit(RegisterErrorState(result.exception));
        }
      case ServerError():
        emit(RegisterErrorState(result.exception));
    }
    // send data to view
  }
}

sealed class RegisterState {}

class RegisterSuccessState extends RegisterState {
  RegisterSuccessState();
}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  Exception? exception;
  RegisterErrorState(this.exception);
}
