import 'package:bloc/bloc.dart';
import 'package:bokia/%20Repository/AuthRepository.dart';
import 'package:meta/meta.dart';

part 'auth_cubit_event.dart';

part 'auth_cubit_state.dart';

class AuthCubitBloc extends Cubit<AuthCubitState> {
  AuthCubitBloc() : super(AuthCubitInitial());

   void login({required String email, required String password})async {
    emit(LoadingState());
    final response = await AuthRepository.login(email: email, password: password);
    if (response is String) {
      emit(LoadingErrorState());
    } else
      emit(LoadingSuccessState());
  }
}
