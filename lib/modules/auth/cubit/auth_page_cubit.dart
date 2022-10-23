import 'package:bloc/bloc.dart';
import 'package:elisoft_flutter_test/models/user.dart';
import 'package:equatable/equatable.dart';

part 'auth_page_state.dart';

enum AuthPageType {
  first_screen,
  sign_in,
  register,
  forgot_password,
  verify_otp,
  complete_profile,
  updatePassword,
}

class AuthPageCubit extends Cubit<AuthPageState> {
  AuthPageCubit() : super(AuthPageInitial());

  Future<void> pageChange(AuthPageType type, {User? user}) async {
    if (type == AuthPageType.register) {
      emit(RegisterPage());
    } else if (type == AuthPageType.forgot_password) {
      emit(ForgotPasswordPage());
    } else if (type == AuthPageType.verify_otp) {
      emit(VerifyOtpPage());
    } else if (type == AuthPageType.sign_in) {
      emit(const SignInPage());
    } else if (type == AuthPageType.complete_profile) {
      emit(CompleteProfilePage(
        user: user!,
      ));
    } else if (type == AuthPageType.updatePassword) {
      emit(UpdatePassword());
    } else {
      emit(FirstPage());
    }
  }
}
