import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adivinanza/core/navigation/navigator.dart';
import 'package:adivinanza/core/util/custom_snack_bar.dart';
import 'package:adivinanza/features/login/domain/usecases/sign_in_email_password_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInEmailPasswordUseCase _signInEmailPasswordUseCase;

  LoginCubit({
    required SignInEmailPasswordUseCase signInEmailPasswordUseCase,
  })  : _signInEmailPasswordUseCase = signInEmailPasswordUseCase,
        super(LoginState.init());

  init(BuildContext context) {}

  Future signIn({BuildContext? context}) async {
    emit(state.copyWith(isLoading: true));
    final result = await _signInEmailPasswordUseCase(
      SignInEmailPasswordParams(
        email: state.emailController.text,
        password: state.passwordController.text,
      ),
    );
    result.fold(
      (dynamic l) {
        emit(state.copyWith(isLoading: false));
        if (context != null) customSnackBar(context, content: l.code);
      },
      (r) async {
        emit(state.copyWith(isLoading: false));
        if (context != null) AppNavigator.pushNamedAndRemoveUntil(Routes.CREATE_TASK);
      },
    );
  }
}
