import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myblog/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:myblog/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:myblog/features/auth/domain/usecases/user_sign_up.dart';
import 'package:myblog/features/auth/presentation/pages/sign_in_page.dart';
import 'core/theme/theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myblog/core/secrets/secrets.dart';
import 'features/auth/presentation/bloc/auth_bloc_bloc.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
    url: Secrets.url,
    // ignore: deprecated_member_use
    anonKey: Secrets.annonkey,
  );
  runApp(MultiBlocProvider(
    
    providers: [
      BlocProvider(create: (_)=>AuthBlocBloc(usersignup: UserSignUp(AuthRepositoryImpl((AuthRemoteDataSourceImpl(supabase.client))))))
    ],
     child: const MyApp())
    
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkThemeMode,
      home: LoginPage(),
    );
  }
}
