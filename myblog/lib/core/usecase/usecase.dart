import 'package:fpdart/fpdart.dart';
import 'package:myblog/core/error/failures.dart';

abstract interface class UseCase<SuccessType,Params>{
  Future<Either<Failure,SuccessType>> call(Params params);

}
class UserSignUpParameters {
  final String name;
  final String email;
  final String password;

  UserSignUpParameters({
    required this.name,
    required this.email,
    required this.password,
  });
}