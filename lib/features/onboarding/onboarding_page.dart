
import 'package:financy_app/common/constants/app_colors.dart';
import 'package:financy_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/multi_text_button.dart';
import '../../common/widgets/primary_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(flex: 1, child: Container(alignment: Alignment.bottomCenter,color: AppColors.iceWhite, child: Padding(padding: const EdgeInsets.all(10),child: Image.asset('assets/images/onboarding_image.png'),),)),
        Expanded(child: Container(color: Colors.white, child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
          const SizedBox(height: 25.0,), 
          Text("Spend Smarter Save More", style: AppTextStyles.mediumText.copyWith(color: AppColors.greenlightTwo), textAlign: TextAlign.center),
          const SizedBox(height: 25.0,), 
          Padding(padding: const EdgeInsets.symmetric(horizontal: 32),child: PrimaryButton(text: 'Get Started', onPressed: (){},),),
          const SizedBox(height: 20.0,), 
          MuiltiTextButton(children: [Text("Already have account?", style: AppTextStyles.smallText.copyWith(color: AppColors.grey),), Text(" Log In", style: AppTextStyles.smallText.copyWith(color: AppColors.greenlightOne),),],onPressed: (){},)
        ],),))
      ],),
    );
  }
}






