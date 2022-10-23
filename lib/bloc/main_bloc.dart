import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:elisoft_flutter_test/api/api_client.dart';
import 'package:elisoft_flutter_test/bloc/fcm/fcm_bloc.dart';
import 'package:elisoft_flutter_test/core/constant.dart';
import 'package:elisoft_flutter_test/modules/auth/repositories/auth_repository.dart';
import 'package:elisoft_flutter_test/repositories/user_repository.dart';
import 'package:elisoft_flutter_test/utils/preference.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required this.fcmBloc}) : super(const MainState()) {
    on<InitializeApp>(_mapInitializeAppToState);
    on<FinishWalktrough>(_mapFinishWalktroughToState);
    on<LoggedIn>(_mapFinishGoHomeToState);
    on<Logout>(_mapLogoutToState);
    on<ReAuthenticate>(_onReAuthenticate);
  }

  final AuthRepository authRepository = AuthRepository();
  final UserRepository userRepository = UserRepository();
  final FcmBloc fcmBloc;

  Future<void> _mapInitializeAppToState(
    InitializeApp event,
    Emitter<MainState> emit,
  ) async {
    await spUtils.putBool(BoxConstant.isFirstApp, false);
    final isFirstApp = spUtils.getBool(BoxConstant.isFirstApp);
    final hasToken = await authRepository.hasToken();
    log('message ::: hasToken ::: $hasToken');

    if (isFirstApp == null || isFirstApp) {
      emit(state.copyWith(mainType: MainType.loading));
    } else if (hasToken) {
      emit(state.copyWith(mainType: MainType.loading));

      try {
        emit(state.copyWith(mainType: MainType.authenticated));
      } catch (e) {
        emit(state.copyWith(mainType: MainType.unauthenticated));
      }
    } else {
      emit(state.copyWith(mainType: MainType.unauthenticated));
    }
  }

  Future<void> _mapFinishWalktroughToState(
    FinishWalktrough event,
    Emitter<MainState> emit,
  ) async {
    try {
      await spUtils.putBool(BoxConstant.isFirstApp, false);
      final isFirstApp = spUtils.getBool(BoxConstant.isFirstApp) ?? false;

      log('mainApp save :: $isFirstApp');
      emit(state.copyWith(mainType: MainType.unauthenticated));
    } catch (e) {
      log('eeeerorr : $e');
      emit(state.copyWith(mainType: MainType.failure));
    }
  }

  Future<void> _mapFinishGoHomeToState(
    LoggedIn event,
    Emitter<MainState> emit,
  ) async {
    // check if role is Guardian
    try {
      log('message ::: _mapFinishGoHomeToState');
      emit(state.copyWith(mainType: MainType.authenticated));
    } catch (e) {
      log('eeeerorr : $e');
      emit(state.copyWith(mainType: MainType.failure));
    }
  }

  Future<void> _onReAuthenticate(
    ReAuthenticate event,
    Emitter<MainState> emit,
  ) async {
    state.copyWith(mainType: MainType.loading);

    final hasToken = await authRepository.hasToken();
    if (hasToken) {
      try {
        // await emit.forEach(
        //   userRepository.getUserInfo(force: true),
        //   onData: (user) {
        //     return state.copyWith(mainType: MainType.authenticated);
        //   },
        //   onError: (_, __) {
        //     return state.copyWith(mainType: MainType.unauthenticated);
        //   },
        // );
      } catch (e) {
        emit(state.copyWith(mainType: MainType.unauthenticated));
      }
    } else {
      emit(state.copyWith(mainType: MainType.unauthenticated));
    }
  }

  Future<void> _mapLogoutToState(
    Logout event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(mainType: MainType.loading));
    try {
      await spUtils.clear();
      await spUtils.putBool(BoxConstant.isFirstApp, false);
      fcmBloc.add(const DeleteFcm());

      await authRepository.signOut();
      await authRepository.clear();
      ApiResource.accessToken = '';

      emit(state.copyWith(mainType: MainType.unauthenticated));
    } catch (e) {
      log('eeeerorr : $e');
      emit(state.copyWith(mainType: MainType.failure, message: '$e'));
    }
  }
}
