import 'package:financy_app/common/widgets/password_form_field.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/app_text_styles.dart';
import '../../common/widgets/custom_text_form_field.dart';
import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage ({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

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
          CustomTextFormField(hintText: 'Eric Hausman', labelText: 'your name', textCapitalization: TextCapitalization.words, keyboardType: TextInputType.name, validator: validateName,),
          CustomTextFormField(hintText: 'your@email.com', labelText: 'your email', textCapitalization: TextCapitalization.words, keyboardType: TextInputType.emailAddress,validator: (value){if(value != null && value.isEmpty){return "This field cannot be empty!";}  return null;},),
          PasswordFormField(helperText: "Must have at least 8 characters, 1 capital letter and 1 number",hintText: '******', labelText: 'Choose your password',validator: (value){if(value != null && value.isEmpty){return "This field cannot be empty!";}  return null;},),
          PasswordFormField(hintText: '******', labelText: 'Confirm your password',validator: (value){if(value != null && value.isEmpty){return "This field cannot be empty!";}  return null;},),
        ],)),
        const SizedBox(height: 20.0,), 
        Padding(padding: const EdgeInsets.symmetric(horizontal: 32),child: PrimaryButton(text: 'Sign Up', onPressed: (){
          final valid = _formKey.currentState != null && _formKey.currentState!.validate();
          if(valid){

          }
        },),),
        const SizedBox(height: 20.0,), 
        MuiltiTextButton(children: [Text("Already have account?", style: AppTextStyles.smallText.copyWith(color: AppColors.grey),), Text(" Log In", style: AppTextStyles.smallText.copyWith(color: AppColors.greenlightOne),),],onPressed: (){},)
      ],),
    );
  }

  String? validateName(value){if(value != null && value.isEmpty){return "This field cannot be empty!";}  return null;}
}

