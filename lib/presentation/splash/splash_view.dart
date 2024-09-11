import 'dart:async';

import 'package:flutter/material.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/assets_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/color_manager.dart';

import '../recources/routs.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  Timer? _timer;

  _startDelay(){
    _timer = Timer(Duration(seconds: 3), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, Routs.onBoardingRoute);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image(image: AssetImage(ImageAssets.splashLogo)),
      ),
    );
  }
}
