part of 'auth_cubit_bloc.dart';

@immutable
sealed class AuthCubitState {}

final class AuthCubitInitial extends AuthCubitState {}

final class LoadingState extends AuthCubitState {}

final class LoadingSuccessState extends AuthCubitState {}

final class LoadingErrorState extends AuthCubitState {}
