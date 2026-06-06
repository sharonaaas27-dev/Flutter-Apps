import 'package:supabase/supabase.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<String> signInWithEmailPassword({
    required String email,
    required String password,
  });
}
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(
    this.supabaseClient
    );

  @override
  Future<String> signUpWithEmailPassword({
     required String email,
     required String password, 
     required String name
     }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
        data: {
          'name': name,
        },
      );

    if (response.session != null) {
      return response.user!.id;
    } else {
      throw Exception('Failed to sign up');
    }
  }

  @override
  Future<String> signInWithEmailPassword({
    required String email,
    required String password
     }) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
      
    );
    if (response.session != null) {
      return response.user!.id;
    } else {
      throw Exception('Failed to sign In');
    }
  }
}
