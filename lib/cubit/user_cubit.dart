import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:misefood/models/models.dart';
import 'package:misefood/services/services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> signIn(String email, String password) async {
    ApiReturnValue<User> result = await UserServices.signIn(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> signUp(User user, String password, {File pictureFile}) async {
    ApiReturnValue<User> result =
        await UserServices.signUp(user, password, pictureFile: pictureFile);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }

  Future<void> uploadProfilePicture(File pictureFile) async {
    ApiReturnValue<String> result =
        await UserServices.uploadProfilePicture(pictureFile);

    if (result.value != null) {
      emit(UserLoaded((state as UserLoaded).user.copyWith(
          picturePath: "http://misefood-laravel.xyz/storage/" + result.value)));
    }
  }

  // ANCHOR : UJI COBA EDIT PROFILE

  // Future<void> editProfile(User user) async {
  //   ApiReturnValue<User> result = await UserServices.editProfile(user);

  //   if (result.value != null) {
  //     emit(UserLoaded(state as UserLoaded).user.copyWith(name: result.value,  ));
  //   } else {

  //   }
  // }

  // ANCHOR : LOG OUT
  Future<void> logOut() async {
    ApiReturnValue<User> result = await UserServices.logOut();

    if (result.value != null) {
      emit(UserInitial());
    } else {
      emit(UserLoadingFailed(result.message));
    }
  }
}
