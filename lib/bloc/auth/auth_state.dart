part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoaded extends AuthState {
  String username;

  AuthLoaded({required this.username});

  @override
  List<Object> get props => [username];
}

class AuthFailed extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthValidateMessage extends AuthState {
  String message;

  AuthValidateMessage({required this.message});

  @override
  List<Object> get props => [message];
}
