part of 'profile_bloc.dart';

// @immutable
// abstract class ProfileState extends Equatable {
//   const ProfileState();
// }

enum ProfileStatus {
  initial,
  loading,
  success,
  failure,
  empty,
}

class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user,
    this.message = '',
  });

  final ProfileStatus status;
  final User? user;
  final String message;

  ProfileState copy({
    ProfileStatus? status,
    User? user,
    String? message,
  }) =>
      ProfileState(
        status: status ?? this.status,
        user: user ?? this.user,
        message: message ?? this.message,
      );

  @override
  List<Object> get props => [message, status];
}
