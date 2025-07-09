import 'package:dio/dio.dart';
import 'package:doc_app/core/networking/api_service.dart';
import 'package:doc_app/features/login/data/repos/login_repo.dart';
import 'package:doc_app/features/login/logic/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}
