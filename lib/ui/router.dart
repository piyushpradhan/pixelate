import 'package:blog/ui/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String initialRoute = "/login";

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Container(
                child: Text("Invalid route!"),
              ),
            ),
          ),
        );
    }
  }
}
