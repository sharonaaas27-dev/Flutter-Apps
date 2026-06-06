import 'package:fpdart/fpdart.dart';
import 'package:myblog/core/error/failures.dart';
import 'package:myblog/features/auth/domain/repository/auth_repository.dart';
import 'package:myblog/core/usecase/usecase.dart';

class UserSignUp implements UseCase<String, UserSignUpParameters> {
  UserSignUp(this.authrepository);

  final AuthRepository authrepository;

  @override
  Future<Either<Failure,String>> call(UserSignUpParameters parameters) async {
    return await authrepository.signUpWithEmailPassword(
      name: parameters.name,
      email: parameters.email,
      password: parameters.password,
    );
  }
}
