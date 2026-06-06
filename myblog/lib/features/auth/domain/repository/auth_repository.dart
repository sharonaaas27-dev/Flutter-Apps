import 'package:fpdart/fpdart.dart';
import 'package:myblog/core/error/failures.dart';
abstract interface class AuthRepository {
    Future<Either<Failure,String>>signUpWithEmailPassword({ 
       required String email,
       required String password,
       required String name,
     });
    Future<Either<Failure,String>>signInWithEmailPassword({ 
       required String email,
       required String password,
     });
    
}
