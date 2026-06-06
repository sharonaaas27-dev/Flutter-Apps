part of 'auth_bloc_bloc.dart';

sealed class AuthBlocState {}

final class AuthBlocInitial extends AuthBlocState {
    
}

final class AuthBlocSuccess extends AuthBlocState {
  final String uid;
  AuthBlocSuccess(this.uid);
}

final class AuthBlocFailure extends AuthBlocState {
  final String message;
   AuthBlocFailure(this.message);
}

final class AuthBlocLoading extends AuthBlocState {
 
}
