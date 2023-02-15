part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoadingState extends AuthState {}

class ErrorState extends AuthState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}

class PhoneNumberSubmittedState extends AuthState {}

class OTPVerifiedState extends AuthState {}
