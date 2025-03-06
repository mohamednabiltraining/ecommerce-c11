import 'package:ecommerce_app/data/model/requests/register_request.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/presentation/core/routes_manager/routes.dart';
import 'package:ecommerce_app/presentation/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/presentation/features/auth/presentation/view_models/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../../../core/widget/main_text_field.dart';
import '../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterViewModel>(),
      child: BlocConsumer<RegisterViewModel, RegisterState>(
        listener: (context, state) {
          switch (state) {
            case RegisterLoadingState _:
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                      child: CircularProgressIndicator.adaptive()));
              break;

            case RegisterSuccessState _:
              Navigator.pushReplacementNamed(context, Routes.mainRoute);
              break;

            case RegisterErrorState _:
              {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.exception.toString()),
                ));
              }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSize.s40.h,
                        ),
                        Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                        SizedBox(
                          height: AppSize.s40.h,
                        ),
                        BuildTextField(
                          backgroundColor: ColorManager.white,
                          hint: 'enter your full name',
                          label: 'Full Name',
                          controller: _nameController,
                          textInputType: TextInputType.name,
                          validation: AppValidators.validateFullName,
                        ),
                        SizedBox(
                          height: AppSize.s18.h,
                        ),
                        BuildTextField(
                          hint: 'enter your mobile no.',
                          backgroundColor: ColorManager.white,
                          label: 'Mobile Number',
                          controller: _phoneController,
                          validation: AppValidators.validatePhoneNumber,
                          textInputType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: AppSize.s18.h,
                        ),
                        BuildTextField(
                          hint: 'enter your email address',
                          backgroundColor: ColorManager.white,
                          label: 'E-mail address',
                          controller: _emailController,
                          validation: AppValidators.validateEmail,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: AppSize.s18.h,
                        ),
                        BuildTextField(
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          label: 'password',
                          controller: _passwordController,
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: AppSize.s50.h,
                        ),
                        Center(
                          child: SizedBox(
                            height: AppSize.s60.h,
                            width: MediaQuery.of(context).size.width * .9,
                            child: CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              label: 'Sign Up',
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s20),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<RegisterViewModel>()
                                      .register(RegisterRequest(
                                        name: _nameController.text,
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        phone: _phoneController.text,
                                      ));
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
