import 'package:flutter/material.dart';
import 'package:udemy_mvvm_seriese/presentation/forgetpassword/forgetpassword_view.dart';
import 'package:udemy_mvvm_seriese/presentation/login/login_view.dart';
import 'package:udemy_mvvm_seriese/presentation/main/main_view.dart';
import 'package:udemy_mvvm_seriese/presentation/onboarding/onboarding_view.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/string_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/register/register_view.dart';
import 'package:udemy_mvvm_seriese/presentation/splash/splash_view.dart';
import 'package:udemy_mvvm_seriese/presentation/storedetails/storedetails_view.dart';

class Routs{
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String logInRoute = "/logIn";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgetPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routs.splashRoute:
        return MaterialPageRoute(builder: (context) => SplashView(),);
      case Routs.onBoardingRoute:
        return MaterialPageRoute(builder: (context) => OnboardingView(),);
      case Routs.logInRoute:
        return MaterialPageRoute(builder: (context) => LoginView(),);
      case Routs.registerRoute:
        return MaterialPageRoute(builder: (context) => RegisterView(),);
      case Routs.forgotPasswordRoute:
        return MaterialPageRoute(builder: (context) => ForgetPasswordView(),);
      case Routs.mainRoute:
        return MaterialPageRoute(builder: (context) => MainView(),);
      case Routs.storeDetailsRoute:
        return MaterialPageRoute(builder: (context) => StoreDetailsView(),);
      default :
        return unDefinedRoute();

    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (context) => Scaffold(
      appBar: AppBar(title: Text(AppStrings.noRouteFound),),
      body: Center(child: Text(AppStrings.noRouteFound),),
    ),);
  }
}