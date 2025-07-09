import 'package:doc_app/features/login/data/repos/login_repo.dart';
import 'package:doc_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_request_body.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(const LoginState.loading());
    final result = await loginRepo.login(loginRequestBody: loginRequestBody);
    result.when(
      success: (loginResponse) => emit(LoginState.success(loginResponse)),
      failure: (error) =>
          emit(LoginState.error(error: error.apiErrorModel.message??'')),
    );
  }
}
