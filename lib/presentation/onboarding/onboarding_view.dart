import 'package:flutter/material.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/color_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/string_manager.dart';
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkPrimary,
      body: Center(
        child: Text(AppStrings.onBoardingTitle1),
      ),
    );
  }
}
