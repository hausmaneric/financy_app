
import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  const CustomTextFormField({
    super.key, this.padding, this.hintText, this.labelText, this.textCapitalization, this.controller, this.keyboardType, this.maxLength, this.textInputAction, this.suffixIcon, this.obscureText, this.validator, this.helperText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  final defaultBorder = const OutlineInputBorder(borderSide: BorderSide(color: AppColors.greenlightTwo));
  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      child: TextFormField(onChanged: (value){
        if(value.length == 1){
          setState(() {
            _helperText = null;
          });
        }else if(value.isEmpty){
          setState(() {
            _helperText = widget.helperText;
          });
        }
      },validator: widget.validator,obscureText: widget.obscureText ?? false,textInputAction: widget.textInputAction,maxLength: widget.maxLength,keyboardType: widget.keyboardType,controller: widget.controller,textCapitalization: widget.textCapitalization ?? TextCapitalization.none,decoration: InputDecoration(
        helperText: _helperText, helperMaxLines: 3, suffixIcon: widget.suffixIcon,hintText: widget.hintText, hintStyle: AppTextStyles.smallText.copyWith(color: AppColors.lightGrey),floatingLabelBehavior: FloatingLabelBehavior.always,labelText: widget.labelText?.toUpperCase(), labelStyle: AppTextStyles.smallText.copyWith(color: AppColors.lightGrey),border: defaultBorder, focusedBorder: defaultBorder, errorBorder: defaultBorder.copyWith(borderSide: const BorderSide(color: Colors.red)), enabledBorder: defaultBorder, disabledBorder: defaultBorder,),),
    );
  }
}