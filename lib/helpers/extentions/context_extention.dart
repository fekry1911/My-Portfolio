import 'package:flutter/cupertino.dart';

extension NavigatorContext on BuildContext{
  void pushNamed(String routeName,{Object? arguments}){
    Navigator.of(this).pushNamed(routeName,arguments: arguments);
  }

}