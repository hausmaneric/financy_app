import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const PasswordFormField({super.key, this.padding, this.controller, this.hintText, this.labelText, this.validator, this.helperText});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(helperText: widget.helperText,validator: widget.validator,obscureText: isHidden,controller: widget.controller, padding: widget.padding, hintText: widget.hintText,labelText: widget.labelText, suffixIcon: InkWell(borderRadius: BorderRadius.circular(23.0),child: Icon(isHidden ? Icons.visibility : Icons.visibility_off, color: AppColors.greenlightTwo,), onTap: () => setState(() {isHidden = !isHidden;}),),);
  }
}