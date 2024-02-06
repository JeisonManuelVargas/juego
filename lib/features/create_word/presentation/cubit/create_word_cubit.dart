import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adivinanza/core/navigation/navigator.dart';
import 'package:adivinanza/core/util/custom_snack_bar.dart';
import 'package:adivinanza/features/create_word/domain/usecases/create_word_use_case.dart';

part 'create_word_state.dart';

class CreateWordCubit extends Cubit<CreateWordState> {
  final CreateWordUseCase _createWordUseCase;

  CreateWordCubit({required CreateWordUseCase createWordUseCase})
      : _createWordUseCase = createWordUseCase,
        super(CreateWordState.init());

  init(BuildContext context) => emit(state.copyWith());

  createWordValidation({required BuildContext context}) {
    if (state.textController.text.isNotEmpty) {
      emit(state.copyWith(isLoading: true));
      _createWord(context: context);
    }else{
      customSnackBar(
        context,
        isSuccess: false,
        content: "Es necesario que digite la palabra antes de guardar",
      );
    }
  }

  _createWord({BuildContext? context}) async {
    final result = await _createWordUseCase(state.textController.text);
    result.fold(
      (dynamic l) {
        if (context != null) customSnackBar(context, content: l.code);
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        if (context != null) {
          customSnackBar(
            context,
            isSuccess: true,
            content: "Se edito correctamente la palabra",
          );
        }
        emit(state.copyWith(isLoading: false));
      },
    );
  }

  goBack() => AppNavigator.pop();
}
