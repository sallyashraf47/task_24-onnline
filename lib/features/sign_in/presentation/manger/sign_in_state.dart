part of 'sign_in_cubit.dart';

@immutable
abstract class SignInState {}

class SignInInitial extends SignInState {}
class SignInLoading extends SignInState {}
class SignSuccess extends SignInState {}
class SignFailure extends SignInState {
  final String errorMassage;

  SignFailure({required this.errorMassage});
}
