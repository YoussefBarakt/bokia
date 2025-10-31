import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bokia/feature/data/AuthRepository.dart';
import 'package:bokia/feature/data/models/Register_RequestModel.dart';
part 'auth_cubit_state.dart';

class AuthCubitBloc extends Cubit<AuthCubitState> {
  AuthCubitBloc() : super(AuthCubitInitial());

  void login({required String email, required String password}) async {
    emit(LoadingState());
    try {
      final response = await AuthRepository.login(
        email: email,
        password: password,
      );

      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final token = response['data']?['token']?.toString() ?? '';

        if (token.isNotEmpty) {
          emit(LoadingSuccessState(token));
        } else {
          emit(LoadingErrorState("Token not found in response"));
        }
      } else {
        emit(LoadingErrorState("Unexpected response format"));
      }
    } catch (e) {
      emit(LoadingErrorState("Login failed: $e"));
    }
  }


  void register(RegisterRequestmodel registerModel) async {
    emit(RegisterLoading());
    try {
      final response = await AuthRepository.register(registerModel);

      if (response is Map<String, dynamic> && response.containsKey('data')) {
        final token = response['data']?['token']?.toString() ?? '';

        if (token.isNotEmpty) {
          emit(RegisterSuccess());
        } else {
          emit(RegisterErrorState("Token not found in response"));
        }
      } else {
        emit(RegisterErrorState("Unexpected response format"));
      }
    } catch (e) {
      emit(RegisterErrorState("Register failed: $e"));
    }
  }

}
