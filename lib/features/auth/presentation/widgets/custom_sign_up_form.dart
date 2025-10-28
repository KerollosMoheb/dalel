import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_conditions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          showToast("Account Created Successfully");
          customReplacementNavigate(context, "/home");
        } else if (state is SignUpFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signUpFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (firstName) {
                  authCubit.firstName = firstName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obsecurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    authCubit.obsecurePasswordText();
                  },
                ),
                obscureText: authCubit.obsecurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              TermsAndConditionsWidget(),
              SizedBox(height: 88),
              state is SignUpLoadingState
                  ? CircularProgressIndicator(color: AppColors.primaryColor)
                  : CustomBtn(
                      color: authCubit.termsAndConditionsCheckBoxValue == false
                          ? AppColors.grey
                          : null,
                      text: AppStrings.signUp,
                      onPressed: () {
                        if (authCubit.termsAndConditionsCheckBoxValue == true) {
                          if (authCubit.signUpFormKey.currentState!
                              .validate()) {
                            // authCubit.signUpFormKey.currentState!.save();
                            authCubit.signUpWithEmailAndPassword();
                          }
                        }
                      },
                    ),
            ],
          ),
        );
      },
    );
  }
}
