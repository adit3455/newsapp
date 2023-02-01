import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/blocs/export_blocs.dart';
import 'package:news_app/repositories/baseauth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BaseAuth authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthentitcated()) {
    on<SignInRequested>(_onSigninRequested);
    on<SignUpRequested>(_onSignupRequested);
    on<GoogleSignInRequested>(_onGoogleSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    on<SignUpWithEmailAndPassword>(_onSignUpWithEmailAndPassword);
  }

  void _onSigninRequested(
      SignInRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await authRepository.signIn(email: event.email, password: event.password);
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthentitcated());
    }
  }

  void _onSignupRequested(
      SignUpRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    try {
      await authRepository.signInWithGoogle();
      emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthentitcated());
    }
  }

  void _onGoogleSignInRequested(
      GoogleSignInRequested event, Emitter<AuthState> emit) {}

  void _onSignOutRequested(
      SignOutRequested event, Emitter<AuthState> emit) async {
    emit(Loading());
    await authRepository.signOut();
    emit(UnAuthentitcated());
  }

  void _onSignUpWithEmailAndPassword(
      SignUpWithEmailAndPassword event, Emitter<AuthState> emit) {
    try {
      authRepository.signUpWithEmailAndPassword(
          email: event.email, password: event.password, name: event.name);
      authRepository.signOut();
      emit(AuthRegistration());
      emit(UnAuthentitcated());
    } catch (e) {
      emit(
        AuthError(e.toString()),
      );
    }
  }
}
