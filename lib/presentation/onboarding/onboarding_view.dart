import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy_mvvm_seriese/presentation/onboarding/onboarding_viewmodel.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/assets_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/color_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/string_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/value_manager.dart';

import '../../domain/model.dart';
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {


  PageController _pageController = PageController(initialPage: 0);

  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bind(){
    _viewModel.start();
  }


  @override
  void initState() {
    _bind();
    super.initState();
  }


  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(stream: _viewModel.outputSliderViewObject, builder: (context, snapshot) {
      return _getContentWidget(snapshot.data);
    },);
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject){
    if(sliderViewObject == null){
      return Container();
    }else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSizes.s0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          itemCount: sliderViewObject?.numOfSlides,
          controller: _pageController,
          onPageChanged: (index) {
            _viewModel.onPageChange(index);
          },

          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject!.sliderObject);
          },),
        // add Bottom Sheet
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppSizes.s130,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(onPressed: () {},
                    child: Text(AppStrings.skip, textAlign: TextAlign.end,)),
              ),
              _getBottomSheetWidget(sliderViewObject!),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          // For Back Page
          Padding(padding: EdgeInsets.all(AppPaddings.p14),
            child: IconButton(
                onPressed: () {
                  // goto Previous Page
                  _pageController.animateToPage(_viewModel.goPrevious(), duration: Duration(milliseconds: DurationConstant.d4), curve: Curves.bounceInOut);
                },
                icon: FaIcon(FontAwesomeIcons.backward,
                  size: 20, color: ColorManager.white,
                )),
          ),

          // Page Indicator

          Row(
            children: [
              for(int i = 0; i< sliderViewObject.numOfSlides; i++)
                Padding(padding: EdgeInsets.all(AppPaddings.p8),
                child: _getProperCircle(i, sliderViewObject.currentIndex),
                )
            ],
          ),


          //For Next Page
          Padding(padding: EdgeInsets.all(AppPaddings.p14),
            child: IconButton(
                onPressed: () {
                  // goto next Page

                  _pageController.animateToPage(_viewModel.goNext(), duration: Duration(milliseconds: DurationConstant.d4), curve: Curves.bounceInOut);

                },
                icon: FaIcon(FontAwesomeIcons.forward,
                  size: 20, color: ColorManager.white,
                )),
          )
        ],
      ),
    );
  }


  Widget _getProperCircle(int index, int _currentIndex){
    if(index == _currentIndex){
      return Icon(Icons.circle_outlined, size: 10, color: ColorManager.white,);
    }else{
      return Icon(Icons.circle, size: 10, color: ColorManager.white);
    }
  }
}
class OnBoardingPage extends StatelessWidget {
  SliderObject sliderObject;
   OnBoardingPage(this.sliderObject,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         const SizedBox(height: AppSizes.s40,),
         Padding(
           padding: const EdgeInsets.all(AppPaddings.p8),
           child: Text(sliderObject.title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineLarge,),
         ),
         Padding(
          padding: const EdgeInsets.all(AppPaddings.p8),
          child: Text(sliderObject.subTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.titleMedium,),
        ),
         const SizedBox(height: AppSizes.s60,),
         Image(image: AssetImage(sliderObject.image)),

      ],
    );
  }
}



