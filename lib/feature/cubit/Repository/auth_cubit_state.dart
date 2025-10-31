part of 'auth_cubit_bloc.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class LoadingState extends AuthCubitState {}

final class LoadingSuccessState extends AuthCubitState {
  final String token;
  LoadingSuccessState(this.token);
}

final class LoadingErrorState extends AuthCubitState {
  final String error;
  LoadingErrorState(this.error);
}

final class RegisterLoading extends AuthCubitState {}

final class RegisterSuccess extends AuthCubitState {}

final class RegisterErrorState extends AuthCubitState {
  final String error;
  RegisterErrorState(this.error);
}

final class LogoutSuccess extends AuthCubitState {}
