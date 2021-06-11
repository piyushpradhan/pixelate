import 'package:blog/ui/router.dart';
import 'package:flutter/material.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pixelate",
      theme: ThemeData(
        fontFamily: "Retro",
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white)
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black.withOpacity(0),
        )
      ),
      initialRoute: '/',
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}
