import 'package:bloc/bloc.dart';
import 'package:elisoft_flutter_test/exception/app_exception.dart';
import 'package:elisoft_flutter_test/models/user.dart';
import 'package:elisoft_flutter_test/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const ProfileState()) {
    on<LoadProfile>(_onLoadProfile);
  }

  final UserRepository userRepository = UserRepository();

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copy(status: ProfileStatus.loading));

    try {
      final session = await userRepository.getUser();
      emit(
        state.copy(
          status: ProfileStatus.success,
          user: session,
        ),
      );
    } on AppException catch (error) {
      emit(state.copy(status: ProfileStatus.failure, message: error.message));
    } catch (error) {
      emit(state.copy(status: ProfileStatus.failure, message: 'Uncatagories'));
    }
  }
}
