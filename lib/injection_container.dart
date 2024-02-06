import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:adivinanza/features/home/presentation/cubit/home_cubit.dart';
import 'package:adivinanza/features/login/presentation/cubit/login_cubit.dart';
import 'package:adivinanza/features/home/domain/usecases/get_word_use_case.dart';
import 'package:adivinanza/features/home/data/data_sources/home_data_source.dart';
import 'package:adivinanza/features/login/data/data_sources/login_data_source.dart';
import 'package:adivinanza/features/login/domain/repositories/login_repository.dart';
import 'package:adivinanza/features/home/data/repositories/home_repository_impl.dart';
import 'package:adivinanza/features/login/data/repositories/login_repository_impl.dart';
import 'package:adivinanza/features/home/domain/repositories/home_auth_repository.dart';
import 'package:adivinanza/features/create_word/domain/usecases/create_word_use_case.dart';
import 'package:adivinanza/features/create_word/presentation/cubit/create_word_cubit.dart';
import 'package:adivinanza/features/create_word/data/data_sources/create_word_data_source.dart';
import 'package:adivinanza/features/login/domain/usecases/sign_in_email_password_use_case.dart';
import 'package:adivinanza/features/create_word/domain/repositories/create_word_repository.dart';
import 'package:adivinanza/features/create_word/data/repositories/create_word_repository_impl.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl

    //cubit
    ..registerFactory<HomeCubit>(() => HomeCubit(getWordUseCase: sl()))
    ..registerFactory<LoginCubit>(() => LoginCubit(signInEmailPasswordUseCase: sl()))
    ..registerFactory<CreateWordCubit>(() => CreateWordCubit(createWordUseCase: sl()))

    //user Case
    ..registerFactory<SignInEmailPasswordUseCase>(
      () => SignInEmailPasswordUseCase(loginRepository: sl()),
    )
    ..registerFactory<GetWordUseCase>(
      () => GetWordUseCase(homeRepository: sl()),
    )
    ..registerFactory<CreateWordUseCase>(
      () => CreateWordUseCase(createWordRepository: sl()),
    )

    //Repository
    ..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()),
    )
    ..registerFactory<CreateWordRepository>(
      () => CreateWordRepositoryImpl(createWordDataSource: sl()),
    )
    ..registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(loginDataSource: sl()),
    )
    //Dara source
    ..registerFactory<HomeDataSource>(() => HomeDataSourceImpl(db: sl()))
    ..registerFactory<LoginDataSource>(() => LoginDataSourceImpl(db: sl(), auth: sl()))
    ..registerFactory<CreateWordDataSource>(() => CreateWordDataSourceImpl(firestore: sl()))
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
