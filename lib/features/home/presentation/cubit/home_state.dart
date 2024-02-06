part of 'home_cubit.dart';

class HomeState {
  final bool isLoading;
  final bool activeAlert;
  final List<String> word;
  final String initialWord;
  final List<String> alfabeto;

  const HomeState({
    required this.word,
    required this.alfabeto,
    required this.isLoading,
    required this.initialWord,
    required this.activeAlert,
  });

  factory HomeState.init() =>const HomeState(
      alfabeto: ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","ñ","o","p","q","r","s","t","u","v","w","x","y","z"],
      word: [],
      isLoading:false,
      activeAlert:false,
      initialWord: "Amor",
      );

  HomeState copyWith({
    bool? isLoading,
    bool? activeAlert,
    List<String>? word,
    String? initialWord,
  }) => HomeState(
    alfabeto: alfabeto,
    word: word ?? this.word,
    isLoading: isLoading ?? this.isLoading,
    activeAlert: activeAlert ?? this.activeAlert,
    initialWord: initialWord ?? this.initialWord,
  );
}
