import 'package:ecommerce_app/data/model/requests/login_request.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/presentation/core/resources/assets_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/color_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/font_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/styles_manager.dart';
import 'package:ecommerce_app/presentation/core/resources/values_manager.dart';
import 'package:ecommerce_app/presentation/core/routes_manager/routes.dart';
import 'package:ecommerce_app/presentation/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/presentation/core/widget/main_text_field.dart';
import 'package:ecommerce_app/presentation/core/widget/validators.dart';
import 'package:ecommerce_app/presentation/features/auth/presentation/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginViewModel>(),
      child: BlocConsumer<LoginViewModel, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginLoadingState():
              showDialog(
                  context: context,
                  builder: (context) =>
                      const Center(child: CircularProgressIndicator()));
              break;

            case LoginSuccessState():
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.mainRoute, (route) => false);
              break;

            case LoginErrorState():
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
                        Text(
                          'Welcome Back To Route',
                          style: getBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s24.sp),
                        ),
                        Text(
                          'Please sign in with your mail',
                          style: getLightStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(
                          height: AppSize.s50.h,
                        ),
                        BuildTextField(
                          backgroundColor: ColorManager.white,
                          controller: _userNameController,
                          hint: 'enter your name',
                          label: 'User name',
                          textInputType: TextInputType.emailAddress,
                          validation: AppValidators.validateEmail,
                        ),
                        SizedBox(
                          height: AppSize.s28.h,
                        ),
                        BuildTextField(
                          controller: _passwordController,
                          hint: 'enter your password',
                          backgroundColor: ColorManager.white,
                          label: 'Password',
                          validation: AppValidators.validatePassword,
                          isObscured: true,
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(
                          height: AppSize.s8.h,
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                                onTap: () {},
                                child: Text(
                                  'Forget password?',
                                  style:
                                      getMediumStyle(color: ColorManager.white)
                                          .copyWith(fontSize: FontSize.s18.sp),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: AppSize.s60.h,
                        ),
                        Center(
                          child: SizedBox(
                            // width: MediaQuery.of(context).size.width * .8,
                            child: CustomElevatedButton(
                                // borderRadius: AppSize.s8,
                                isStadiumBorder: false,
                                label: 'Login',
                                backgroundColor: ColorManager.white,
                                textStyle: getBoldStyle(
                                    color: ColorManager.primary,
                                    fontSize: AppSize.s18),
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<LoginViewModel>().login(
                                        LoginRequest(
                                            email: _userNameController.text,
                                            password:
                                                _passwordController.text));

                                    // Navigator.pushNamedAndRemoveUntil(
                                    //     context, Routes.mainRoute, (route) => false);
                                  }
                                }),
                          ),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account?',
                              style: getSemiBoldStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s16.sp),
                            ),
                            SizedBox(
                              width: AppSize.s8.w,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, Routes.signUpRoute),
                              child: Text(
                                'Create Account',
                                style:
                                    getSemiBoldStyle(color: ColorManager.white)
                                        .copyWith(fontSize: FontSize.s16.sp),
                              ),
                            ),
                          ],
                        )
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
