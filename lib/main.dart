import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/const/const.dart';
import 'package:my_portfolio/helpers/router/app_router.dart';
import 'package:my_portfolio/presentation/screens/header.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // <-- دي النقطة المهمة

  );
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
   MyApp({super.key,required this.appRouter});
   AppRouter appRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
      //initialRoute: homeScreen,
      title: 'Flutter Demo',
      home:Header(),
      theme: ThemeData.dark().copyWith(
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Open Sans'),
      ),
    );
  }
}

