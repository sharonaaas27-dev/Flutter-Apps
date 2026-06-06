import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myblog/core/usecase/usecase.dart';
import 'package:myblog/features/auth/domain/usecases/user_sign_up.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';


class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  final UserSignUp _userSignUp;
  AuthBlocBloc({
    required UserSignUp usersignup,
  }) :_userSignUp = usersignup ,
  super(AuthBlocInitial()) {
    on<AuthSignUp>((event,emit)async {
      final res = await _userSignUp(UserSignUpParameters(
        name:event.name, 
        email:event.email,
        password:event.password
         ));
         res.fold((l)=>emit(AuthBlocFailure(l.message)), (r)=>emit(AuthBlocSuccess(r)));
    });

}
}
