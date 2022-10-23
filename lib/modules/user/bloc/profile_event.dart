part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class LoadProfile extends ProfileEvent {
  const LoadProfile({this.userId});

  final String? userId;

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoadProfile';
}

class SelectProfile extends ProfileEvent {
  const SelectProfile({this.userId});

  final String? userId;

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SelectProfile';
}
