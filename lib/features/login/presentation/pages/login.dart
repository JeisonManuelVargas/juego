import 'package:adivinanza/core/extension/containerExtension.dart';
import 'package:adivinanza/core/widget/custom_painter_widget.dart';
import 'package:flutter/material.dart';
import 'package:adivinanza/core/util/app_color.dart';
import 'package:adivinanza/injection_container.dart';
import 'package:adivinanza/core/base/base_page.dart';
import 'package:adivinanza/core/widget/custom_input.dart';
import 'package:adivinanza/core/widget/custom_button.dart';
import 'package:adivinanza/features/login/presentation/cubit/login_cubit.dart';

class Login extends BasePage<LoginState, LoginCubit> {
  const Login({super.key});

  @override
  LoginCubit createBloc(BuildContext context) =>
      sl<LoginCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Form(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: CustomPaint(
              painter: CustomPainterWidget(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      height: context.sizeHeight * 0.25,
                      image: AssetImage("assets/image/rompecabezas.png"),
                    ),
                    Column(
                      children: [
                        CustomInput(
                          label: "Correo",
                          icon: Icons.email_outlined,
                          controller: state.emailController,
                        ),
                        const SizedBox(height: 30),
                        CustomInput(
                          label: "Contraseña",
                          icon: Icons.lock_open,
                          controller: state.passwordController,
                        ),
                      ],
                    ),
                    state.isLoading
                        ? const CircularProgressIndicator()
                        : CustomButton(
                            state: CustomButtonEnum.enable,
                            label: "LOGIN",
                            onTap: () => bloc.signIn(context: context),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
