import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:retensi_bloc/model/users_model.dart';
import 'package:retensi_bloc/services/network/api_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ApiRepository api = ApiRepository();

  AuthBloc() : super(AuthInitial()) {
   // on<AuthEvent>((event, emit) async {
   //   if (event is Login) {
   //     emit(AuthLoading());
   //     if (event.username.isEmpty || event.password.isEmpty) {
   //       emit(AuthError(message: "Kosong"));
   //     } else {
   //       await api.login(username: event.username, password: event.password);
   //       FirebaseMessaging.instance.getToken().then((value) => print(value));
   //       await FirebaseMessaging.instance.subscribeToTopic('retensi');
   //       emit(AuthLoaded(username: event.username));
   //     }
   //   }
   // });
    on<Login>(onLogin);
  }

  Future<void> onLogin(event, emit) async {
    if (event is Login) {
      emit(AuthLoading());
      if (event.username.isEmpty || event.password.isEmpty) {
        emit(AuthError(message: "Kosong"));
      } else {
        UsersModel? users;

        users =  await api.login(username: event.username, password: event.password);

        if (users == null) {
          emit(AuthError(message: "Wrong"));
        } else {
          FirebaseMessaging.instance.getToken().then((value) => print(value));
          FirebaseMessaging.instance.subscribeToTopic('retensi');
          emit(AuthLoaded(username: event.username));
        }
      }
    }
  }
}
