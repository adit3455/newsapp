part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  const SignInRequested(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class SignUpRequested extends AuthEvent {
  final String email;
  final String password;

  const SignUpRequested(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class GoogleSignInRequested extends AuthEvent {}

class SignOutRequested extends AuthEvent {}

class SignUpWithEmailAndPassword extends AuthEvent {
  final String email;
  final String password;
  final String name;

  const SignUpWithEmailAndPassword(this.email, this.password, this.name);

  @override
  List<Object> get props => [email, password, name];
}
