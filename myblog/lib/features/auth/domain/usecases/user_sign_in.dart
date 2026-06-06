import 'package:fpdart/fpdart.dart';
import 'package:myblog/core/error/failures.dart';
import 'package:myblog/features/auth/domain/repository/auth_repository.dart';
import 'package:myblog/core/usecase/usecase.dart';

class UserSignIn implements UseCase<String,UserSignUpParameters>{
  final AuthRepository authrepository;
  UserSignIn(this.authrepository);

   Future<Either<Failure,String>> call(UserSignUpParameters parameters)async{
     return await authrepository.signInWithEmailPassword(
      email: parameters.email,
       password: parameters.password);
   }

}