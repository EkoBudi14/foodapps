part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

// ANCHOR: JIKA USER BERHASIL

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

// ANCHOR JIKA USER GAGAL
class UserLoadingFailed extends UserState {
  final String message;

  UserLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
