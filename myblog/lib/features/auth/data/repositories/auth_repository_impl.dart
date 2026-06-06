import 'package:fpdart/fpdart.dart';
import 'package:myblog/core/error/failures.dart';
import 'package:myblog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:myblog/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  const AuthRepositoryImpl(this.remoteDataSource);

@override
  Future<Either<Failure, String>> signInWithEmailPassword({
    required String email,
    required String password,
  }) async {
    final result = await remoteDataSource.signInWithEmailPassword(
        email: email,
        password: password,
      );
    return Right(result);
  }

  @override
  Future<Either<Failure,String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await remoteDataSource.signUpWithEmailPassword(
      name: name,
      email: email,
      password: password,
    );
    return Right(result);
  }
}
