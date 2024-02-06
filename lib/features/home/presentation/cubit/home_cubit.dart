import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adivinanza/core/base/base_usecase.dart';
import 'package:adivinanza/core/navigation/navigator.dart';
import 'package:adivinanza/core/util/custom_snack_bar.dart';
import 'package:adivinanza/features/home/domain/usecases/get_word_use_case.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetWordUseCase _getWordUseCase;

  HomeCubit({required GetWordUseCase getWordUseCase})
      : _getWordUseCase = getWordUseCase,
        super(HomeState.init());

  init(BuildContext context) async {
    final result = await _getWordUseCase(NoParams());
    result.fold(
      (dynamic l) {
        if (context != null) customSnackBar(context, content: l.code);
        emit(state.copyWith(isLoading: false));
      },
      (r) {
        r.listen((event) {
          String text =
              (event.docs.first.data() as Map<String, dynamic>)["text"];
          emit(state.copyWith(initialWord: text));
        });
      },
    );
    emit(state.copyWith(word: []));
  }

  tapInLetter(String letter) {
    FlutterRingtonePlayer().play(fromAsset: "assets/ringtone/tap.mp3", volume: 1);
    if (state.initialWord.length > state.word.length) {
      List<String> word = state.word;
      word.add(letter);
      emit(state.copyWith(word: word));
    }
    if (state.initialWord.length == state.word.length) {
      startAlertAnimation(true);
      bool validate = state.initialWord.toUpperCase() == state.word.join().toUpperCase();
      if (!validate) {
        FlutterRingtonePlayer().play(fromAsset: "assets/ringtone/error.mp3", volume: 1);
        state.word.clear();
      }else{
        FlutterRingtonePlayer().play(fromAsset: "assets/ringtone/check.mp3", volume: 1);
      }
    }
  }

  refreshController() {
    FlutterRingtonePlayer()
        .play(fromAsset: "assets/ringtone/tap.mp3", volume: 1);
    emit(state.copyWith(word: []));
  }

  deleteLastLetter() {
    FlutterRingtonePlayer()
        .play(fromAsset: "assets/ringtone/tap.mp3", volume: 1);
    List<String> word = state.word;
    word.removeLast();
    emit(state.copyWith(word: word));
  }

  generateWord(int index) {
    if (index <= state.word.length - 1) {
      return state.word[index].toUpperCase();
    }
    return "";
  }

  bool validateLetterIsSuccessful() {
    bool validate =
        state.initialWord.toUpperCase() == state.word.join().toUpperCase();
    return validate;
  }

  goToLogin() => AppNavigator.push(Routes.LOGIN);

  startAlertAnimation(bool status) => emit(state.copyWith(activeAlert: status));

  @override
  Future<void> close() {
    return super.close();
  }
}
