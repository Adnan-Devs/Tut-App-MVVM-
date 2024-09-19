







import 'dart:async';

import 'package:udemy_mvvm_seriese/domain/model.dart';
import 'package:udemy_mvvm_seriese/presentation/base/base_viewmodel.dart';

import '../recources/assets_manager.dart';
import '../recources/string_manager.dart';

class OnBoardingViewModel extends BaseViewmodel with OnBoardingViewModelInputs , OnBoardingViewModelOutputs{

  final StreamController _streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
   _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();

    // send data to View
    _postDataToView();
  }

  @override
 int  goNext() {
    int nextIndex = _currentIndex ++;
    if(nextIndex >= _list.length){
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = _currentIndex --;
    if(previousIndex == -1){
      _currentIndex = _list.length -1;
    }
    return _currentIndex;
  }

  @override
  onPageChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject => _streamController.stream.map((sliderViewObject) => sliderViewObject,);


//private functions

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

  _postDataToView(){
    inputSliderViewObject.add(SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
  
}


abstract mixin class OnBoardingViewModelInputs{

  goNext();
  goPrevious();
  onPageChange(int index);

  Sink get inputSliderViewObject; // this is for to add data to Stream
}
abstract mixin class OnBoardingViewModelOutputs{

  Stream<SliderViewObject> get outputSliderViewObject;
  
}


class SliderViewObject{
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;

  SliderViewObject(this.sliderObject, this.numOfSlides , this.currentIndex);
}

























// import 'dart:async';
// import 'dart:js_interop';
//
// import 'package:udemy_mvvm_seriese/presentation/base/base_viewmodel.dart';
// import '../../domain/model.dart';
// import '../recources/assets_manager.dart';
// import '../recources/string_manager.dart';
//
// class onBoardingViewModel extends BaseViewmodel implements OnboardingViewmodelInputs , OnboardingViewmodelOutputs{
//
//   final StreamController controller = StreamController<SliderViewObject>();
//   late final List<SliderObject> _list;
//   int _currentIndex = 0;
//   @override
//   void dispose() {
//     // TODO: implement dispose
//   }
//
//   @override
//   void start() {
//     // TODO: implement start
//
//     _list = _getSliderData();
//   }
//
//   @override
//   void goNext() {
//     // TODO: implement goNext
//   }
//
//   @override
//   void goPrevious() {
//     // TODO: implement goPrevious
//   }
//
//   @override
//   void onPageChanges(int index) {
//     // TODO: implement onPageChanges
//   }
//
//   @override
//   // TODO: implement inputSliderViewObject
//   Sink get inputSliderViewObject => controller.sink;
//
//   @override
//   // TODO: implement sliderViewObjectOutput
//   Stream<SliderViewObject> get sliderViewObjectOutput => controller.stream.map((sliderViewObject) => sliderViewObject,);
//
//
//
// }
//
// abstract class OnboardingViewmodelInputs{
//   void goNext();  // to go on next page
//   void goPrevious(); // to go on previous page
//   void onPageChanges(int index); // when page change
//
//   Sink get inputSliderViewObject; // to add data to stream
// }
//
// abstract class OnboardingViewmodelOutputs{
//
//   Stream<SliderViewObject>  get sliderViewObjectOutput; // to get data from Sink
//
//
//   // private functions
//
//   List<SliderObject> _getSliderData() =>
//       [
//         SliderObject(
//             AppStrings.onBoardingTitle1, AppStrings.onBoardingSubtitle1,
//             ImageAssets.onBoarding1),
//         SliderObject(
//             AppStrings.onBoardingTitle2, AppStrings.onBoardingSubtitle2,
//             ImageAssets.onBoarding2),
//         SliderObject(
//             AppStrings.onBoardingTitle3, AppStrings.onBoardingSubtitle3,
//             ImageAssets.onBoarding3),
//         SliderObject(
//             AppStrings.onBoardingTitle4, AppStrings.onBoardingSubtitle4,
//             ImageAssets.onBoarding4),
//       ];
//
//
//
// }
//
// class SliderViewObject{
//   SliderObject sliderObject;
//   int numOfSlides;
//   int currentIndex;
//   SliderViewObject(this.sliderObject,this.numOfSlides , this.currentIndex);
// }