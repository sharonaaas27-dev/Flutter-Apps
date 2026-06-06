part of 'auth_bloc_bloc.dart';


@immutable
sealed class AuthBlocEvent {
  
}
final class AuthSignUp extends AuthBlocEvent{
  final String name;
  final String password;
  final String email;

  AuthSignUp({
    required this.name,
     required this.password, 
     required this.email});
}
