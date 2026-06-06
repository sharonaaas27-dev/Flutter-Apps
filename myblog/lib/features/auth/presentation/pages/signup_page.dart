import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myblog/features/auth/presentation/bloc/auth_bloc_bloc.dart';
import 'package:myblog/features/auth/presentation/pages/sign_in_page.dart';
import 'package:myblog/features/auth/presentation/widgets/auth_field.dart';
import 'package:myblog/features/auth/presentation/widgets/gradient_button.dart';
import 'package:myblog/core/theme/app_pallete.dart';


class SignUpPage extends StatefulWidget {
  
  const SignUpPage({super.key});
  @override
  State<SignUpPage> createState() => _SignUpPageState();

  static Route<Object?> route() {
    return MaterialPageRoute(builder: (context) => const SignUpPage());
  }
}

class _SignUpPageState extends State<SignUpPage> {
  final  emailController = TextEditingController();
  final  passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formkey = GlobalKey<FormState>();

   @override
   void dispose(){
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key:formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Sign Up Page', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(height: 20,),
            AuthField(
              hintText: 'Name',
              controller: nameController,
            ),
            SizedBox(height: 20,),
            AuthField(
              hintText: 'Email',
              controller: emailController,
            ),
            SizedBox(height: 20,),
            AuthField(
              hintText: 'Password',
              controller: passwordController,
              isObscureText: true,
            
            ),
            SizedBox(height: 60,),
            GradientButton(
              onPressed: (){
                if(formkey.currentState!.validate()){
                  context.read<AuthBlocBloc>().add(AuthSignUp(
                    name: nameController.text.trim(),
                     password: passwordController.text.trim(), 
                     email: emailController.text.trim()));
                }
              },
              text: 'Sign Up'

              ),
            const SizedBox(height:20),
             GestureDetector(
                    onTap: () {
                      Navigator.push(context, LoginPage.route());
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppPallete.gradient2,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
     ), );
  }
}