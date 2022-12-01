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

class AuthError extends AuthState {
  String message;

  AuthError({required this.message});

  @override
  List<Object> get props => [message];
}
