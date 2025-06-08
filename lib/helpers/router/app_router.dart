import 'package:flutter/material.dart';

import 'package:my_portfolio/main.dart';

import '../../const/const.dart';
import '../../presentation/screens/home.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => HomeSection());

    }
    return null;
  }
}
