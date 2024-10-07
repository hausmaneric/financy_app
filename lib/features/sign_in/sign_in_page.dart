import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/features/sign_in/sign_in_controller.dart';
import 'package:financy_app/features/sign_in/sign_in_state.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage ({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey            = GlobalKey<FormState>();
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller         = locator.get<SignInController>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener((){
      if(_controller.state is SignInLoadingState){
        showDialog(context: context, builder: (context) => const CustomCircularProgressIndicator());
      }
      if(_controller.state is SignInSucessState){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text('Nova Tela'),),)));
      }

      if(_controller.state is SignInErrorState){
        final error = _controller.state as SignInErrorState;
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const SizedBox(height: 20.0,), 
        Text("Welcome Back", style: AppTextStyles.mediumText.copyWith(color: AppColors.greenlightTwo), textAlign: TextAlign.center),
        const SizedBox(height: 25.0,), 
        Image.asset('assets/images/sign_in_image.png'),
        const SizedBox(height: 25.0,), 
        Form(key: _formKey, child: Column(children: [
          CustomTextFormField(controller: _emailController, hintText: 'your@email.com', labelText: 'your email', textCapitalization: TextCapitalization.words, keyboardType: TextInputType.emailAddress,validator: Validator.validateEmail),
          PasswordFormField(controller: _passwordController, helperText: "Must have at least 8 characters, 1 capital letter and 1 number",hintText: '******', labelText: 'Choose your password',validator: Validator.validatePassword),
        ],)),
        const SizedBox(height: 20.0,), 
        Padding(padding: const EdgeInsets.symmetric(horizontal: 32),child: PrimaryButton(text: 'Sign In', onPressed: (){
          final valid = _formKey.currentState != null && _formKey.currentState!.validate();
          if(valid){
            _controller.doSignIn(email: _emailController.text, password: _passwordController.text);
          }
        },),),
        const SizedBox(height: 20.0,), 
        MuiltiTextButton(children: [Text("Don\'t have account?", style: AppTextStyles.smallText.copyWith(color: AppColors.grey),), Text(" Sign Up", style: AppTextStyles.smallText.copyWith(color: AppColors.greenlightOne),),],onPressed: () => Navigator.popAndPushNamed(context, NamedRoute.signUp),)
      ],),
    );
  }

}



