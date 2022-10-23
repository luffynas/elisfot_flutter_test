import 'package:bloc/bloc.dart';
import 'package:elisoft_flutter_test/bloc/main_bloc.dart';
import 'package:elisoft_flutter_test/exception/challenge_exception.dart';
import 'package:elisoft_flutter_test/models/user.dart';
import 'package:elisoft_flutter_test/modules/auth/cubit/auth_page_cubit.dart';
import 'package:elisoft_flutter_test/modules/auth/repositories/auth_repository.dart';
import 'package:elisoft_flutter_test/repositories/user_repository.dart';
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
}
