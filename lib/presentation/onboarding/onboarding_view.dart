import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/assets_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/color_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/string_manager.dart';
import 'package:udemy_mvvm_seriese/presentation/recources/value_manager.dart';
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {


  late final List<SliderObject> _list = _getSliderData();
  PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  List<SliderObject> _getSliderData() =>
      [
        SliderObject(
            AppStrings.onBoardingTitle1, AppStrings.onBoardingSubtitle1,
            ImageAssets.onBoarding1),
        SliderObject(
            AppStrings.onBoardingTitle2, AppStrings.onBoardingSubtitle2,
            ImageAssets.onBoarding2),
        SliderObject(
            AppStrings.onBoardingTitle3, AppStrings.onBoardingSubtitle3,
            ImageAssets.onBoarding3),
        SliderObject(
            AppStrings.onBoardingTitle4, AppStrings.onBoardingSubtitle4,
            ImageAssets.onBoarding4),
      ];

  @override
  Widget build(BuildContext context) {
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
        itemCount: _list.length,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        itemBuilder: (context, index) {
          return OnBoardingPage(_list[index]);
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
            _getBottomSheetWidget(),
          ],
        ),
      ),
    );
  }


  Widget _getBottomSheetWidget() {
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
                  _pageController.animateToPage(_getPreviousIndex(), duration: Duration(milliseconds: DurationConstant.d4), curve: Curves.bounceInOut);
                },
                icon: FaIcon(FontAwesomeIcons.backward,
                  size: 20, color: ColorManager.white,
                )),
          ),

          // Page Indicator

          Row(
            children: [
              for(int i = 0; i<_list.length ; i++)
                Padding(padding: EdgeInsets.all(AppPaddings.p8),
                child: _getProperCircle(i),
                )
            ],
          ),


          //For Next Page
          Padding(padding: EdgeInsets.all(AppPaddings.p14),
            child: IconButton(
                onPressed: () {
                  // goto next Page

                  _pageController.animateToPage(_getNextIndex(), duration: Duration(milliseconds: DurationConstant.d4), curve: Curves.bounceInOut);

                },
                icon: FaIcon(FontAwesomeIcons.forward,
                  size: 20, color: ColorManager.white,
                )),
          )
        ],
      ),
    );
  }

  int _getPreviousIndex(){
    int previousIndex = _currentIndex --;
    if(previousIndex == -1){
      _currentIndex = _list.length -1;
    }
    return _currentIndex;
  }
  int _getNextIndex(){
    int nextIndex = _currentIndex ++;
    if(nextIndex >= _list.length){
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  Widget _getProperCircle(int index){
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


class SliderObject{
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image,);
}
