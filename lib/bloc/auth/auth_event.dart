part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class Login extends AuthEvent {

  String username;
  String password;

  Login({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}