import 'package:bloc/bloc.dart';
import 'package:elisoft_flutter_test/api/app_api.dart';
import 'package:elisoft_flutter_test/bloc/main_bloc.dart';
import 'package:elisoft_flutter_test/exception/challenge_exception.dart';
import 'package:elisoft_flutter_test/models/user.dart';
import 'package:elisoft_flutter_test/modules/auth/cubit/auth_page_cubit.dart';
import 'package:elisoft_flutter_test/modules/auth/repositories/auth_repository.dart';
import 'package:elisoft_flutter_test/repositories/user_repository.dart';
import 'package:elisoft_flutter_test/utils/preference.dart';
import 'package:elisoft_flutter_test/utils/text_util.dart';
import 'package:elisoft_flutter_test/widgets/form_models/form.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.mainBloc,
  }) : super(AuthInitial()) {
    on<SignIn>(_mapSignInToState);
  }

  final AuthRepository authRepository = AuthRepository();
  final UserRepository userRepo = UserRepository();
  final MainBloc mainBloc;

  Future<void> _mapSignInEmailToState(
    SignInEmailChange event,
    Emitter<AuthState> emit,
  ) async {
    //todo(luffynas)
    // - check completely email
    // - sent email to server
    // - email validation form server
    // - if true, open verify OTP page
    // - else, show error information

    final email = Email.dirty(event.email);
    emit(SignInEmailChanged(
      email: email,
      status: Formz.validate([email]),
    ));
  }

  Future<void> _mapSignInPhoneToState(
    SignInPhoneChange event,
    Emitter<AuthState> emit,
  ) async {
    final phone = Phone.dirty(event.phone);
    emit(SignInPhoneChanged(
      phone: phone,
      status: Formz.validate([phone]),
    ));
  }

  Future<void> _mapSignInToState(SignIn event, Emitter<AuthState> emit) async {
    emit(LoginInitial());
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(
        const LoginFieldError(
          error: "Email or Password can't be empty!",
        ),
      );
    } else if (!textUtils.validateEmail(event.email)) {
      emit(
        const LoginFieldError(
          error: 'Please insert a valid email address!',
        ),
      );
    } else if (event.password.length < 6) {
      emit(
        const LoginFieldError(
          error: 'New Password must be at least 6 characters long',
        ),
      );
    } else {
      emit(LoginLoading());

      try {
        final session = await authRepository.authenticate(
          email: event.email,
          password: event.password,
        );

        if (session != null) {
          emit(LoginSuccess());
          mainBloc.add(const InitializeApp());
        }
      } on ChallengeException catch (e) {
        emit(ChallangeUpdatePassword());
      }
    }
  }

  Future<void> _mapSignUpToState(SignUp event, Emitter<AuthState> emit) async {
    emit(LoginInitial());
    if (event.email.isEmpty || event.password.isEmpty) {
      emit(
          const RegisterFieldError(error: "Email or Password can't be empty!"));
    } else if (!textUtils.validateEmail(event.email)) {
      emit(const RegisterFieldError(
          error: 'Please insert a valid email address!'));
    } else if (event.password.length < 6) {
      emit(
        const RegisterFieldError(
          error: 'New Password must be at least 6 characters long',
        ),
      );
    } else if (event.password != event.retypePassword) {
      emit(const RegisterFieldError(error: "Password doest' match"));
    } else {
      emit(RegisterLoading());

      try {
        final session = await authRepository.register(
          fullname: event.fullname,
          email: event.email,
          password: event.password,
        );

        if (session != null) {
          //print("sesssin $session");
          await spUtils.putString('identifier', event.email);
          emit(RegisterSuccess());
        }

        // mainBloc.add(LoggedIn(token: session.token));
      } catch (error) {
        emit(RegisterFailure(error: error.toString()));
      }
    }
  }

  Future<void> _mapVerifyOtpToState(
    VerifyOtp event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginInitial());
    if (event.code.isEmpty || event.code.isEmpty) {
      emit(const VerifyOtpFieldError(
          error: "Email or Password can't be empty!"));
    } else if (event.code.length < 5) {
      emit(
        const VerifyOtpFieldError(
          error: 'New Password must be at least 5 - 6 characters long',
        ),
      );
    } else {
      emit(VerifyOtpLoading());

      try {
        final body = {
          'identifier': spUtils.getString('identifier'),
          'code': event.code,
        };
        final response = await PublicApi.post('/auth/activate', data: body);
        spUtils.removeKey('identifier');
        emit(VerifyOtpSuccess(message: ''));
        // mainBloc.add(LoggedIn(token: session.token));
      } catch (error) {
        emit(VerifyOtpFailure(error: error.toString()));
      }
    }
  }
}
