import 'package:flutter/material.dart';
import 'package:udemy_mvvm_seriese/app/app.dart';

class Test extends StatefulWidget {
  const Test({super.key});




  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {



  void updateState(){
    MyApp.instance.appState = 10;  // here i accessed MyApp
  }

  @override
  Widget build(BuildContext context) {
    print(MyApp.instance.appState);
    return Container();
  }
}
