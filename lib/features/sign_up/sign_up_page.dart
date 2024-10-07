import 'package:financy_app/common/constants/routes.dart';
import 'package:financy_app/common/utils/validator.dart';
import 'package:financy_app/common/widgets/custom_circular_progress_indicator.dart';
import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:financy_app/features/sign_up/sign_up_controller.dart';
import 'package:financy_app/features/sign_up/sign_up_state.dart';
import 'package:financy_app/locator.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_bottom_sheet.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage ({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey            = GlobalKey<FormState>();
  final _nameController     = TextEditingController();
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller         = locator.get<SignUpController>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener((){
      if(_controller.state is SignUpLoadingState){
        showDialog(context: context, builder: (context) => const CustomCircularProgressIndicator());
      }
      if(_controller.state is SignUpSucessState){
        Navigator.pop(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text('Nova Tela'),),)));
      }

      if(_controller.state is SignUpErrorState){
        final error = _controller.state as SignUpErrorState;
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const SizedBox(height: 20.0,), 
        Text("Spend Smarter Save More", style: AppTextStyles.mediumText.copyWith(color: AppColors.greenlightTwo), textAlign: TextAlign.center),
        const SizedBox(height: 25.0,), 
        Image.asset('assets/images/sign_up_image.png'),
        const SizedBox(height: 25.0,), 
        Form(key: _formKey, child: Column(children: [
          CustomTextFormField(controller: _nameController, hintText: 'Eric Hausman', labelText: 'your name', textCapitalization: TextCapitalization.words, keyboardType: TextInputType.name, validator: Validator.validateName,),
          CustomTextFormField(controller: _emailController, hintText: 'your@email.com', labelText: 'your email', textCapitalization: TextCapitalization.words, keyboardType: TextInputType.emailAddress,validator: Validator.validateEmail),
          PasswordFormField(controller: _passwordController, helperText: "Must have at least 8 characters, 1 capital letter and 1 number",hintText: '******', labelText: 'Choose your password',validator: Validator.validatePassword),
          PasswordFormField(hintText: '******', labelText: 'Confirm your password',validator: (value) => Validator.validateConfirmPassword(_passwordController.text, value)),
        ],)),
        const SizedBox(height: 20.0,), 
        Padding(padding: const EdgeInsets.symmetric(horizontal: 32),child: PrimaryButton(text: 'Sign Up', onPressed: (){
          final valid = _formKey.currentState != null && _formKey.currentState!.validate();
          if(valid){
            _controller.doSignUp(name: _nameController.text, email: _emailController.text, password: _passwordController.text);
          }
        },),),
        const SizedBox(height: 20.0,), 
        MuiltiTextButton(children: [Text("Already have account?", style: AppTextStyles.smallText.copyWith(color: AppColors.grey),), Text(" Log In", style: AppTextStyles.smallText.copyWith(color: AppColors.greenlightOne),),],onPressed: (){Navigator.popAndPushNamed(context, NamedRoute.signIn);},)
      ],),
    );
  }

}



