import 'package:ecommerce_app/presentation/core/routes_manager/routes.dart';
import 'package:ecommerce_app/presentation/features/auth/presentation/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginListener extends StatelessWidget {
  const LoginListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      listener: (context, state) {
        switch (state) {
          case LoginSuccessState():
            {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.mainRoute, (Route<dynamic> route) => false);
            }
          case LoginLoadingState():
            {
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ));
            }
          case LoginErrorState():
            {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.exception.toString())));
            }
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
