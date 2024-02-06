import 'package:adivinanza/core/extension/containerExtension.dart';
import 'package:adivinanza/features/create_word/presentation/cubit/create_word_cubit.dart';
import 'package:flutter/material.dart';
import 'package:adivinanza/injection_container.dart';
import 'package:adivinanza/core/base/base_page.dart';
import 'package:adivinanza/core/util/app_color.dart';
import 'package:adivinanza/core/widget/custom_input.dart';
import 'package:adivinanza/core/widget/custom_button.dart';
import 'package:adivinanza/core/widget/custom_painter_widget.dart';

class CreateWord extends BasePage<CreateWordState, CreateWordCubit> {

  const CreateWord({super.key});

  @override
  CreateWordCubit createBloc(BuildContext context) =>
      sl<CreateWordCubit>()..init(context);

  @override
  Widget buildPage(BuildContext context, state, bloc) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: SizedBox(
        width: context.sizeWidth,
        height: context.sizeHeight,
        child: CustomPaint(
          painter: CustomPainterWidget(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: context.sizeHeight * 0.15),
                CustomInput(
                  icon: Icons.text_fields,
                  label: "Palabra",
                  controller: state.textController,
                ),
                SizedBox(height: context.sizeHeight * 0.1),
                state.isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                        state: CustomButtonEnum.enable,
                        label: "Editar Palabra",
                        onTap: () => bloc.createWordValidation(context: context),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
