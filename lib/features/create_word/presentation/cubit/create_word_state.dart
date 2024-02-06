part of 'create_word_cubit.dart';

class CreateWordState {
  final bool isLoading;
  final TextEditingController textController;

  const CreateWordState({
    required this.isLoading,
    required this.textController,
  });

  factory CreateWordState.init() => CreateWordState(

        isLoading: false,
        textController: TextEditingController(),
      );

  CreateWordState copyWith({
    bool? isLoading,
  }) =>
      CreateWordState(
        isLoading: isLoading ?? this.isLoading,
        textController: textController,
      );
}
