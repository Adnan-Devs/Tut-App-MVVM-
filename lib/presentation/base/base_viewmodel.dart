
abstract class BaseViewmodel extends BaseViewModelInputs with BaseViewModelOutputs{
  // shared variables and functions will be used here

}

abstract class BaseViewModelInputs{
  void start(); // will be called when init. of viewmodel
  void dispose(); // will be called when dies viewmodel
}

abstract mixin  class BaseViewModelOutputs{

}