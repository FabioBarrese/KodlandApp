import 'package:kodland_app/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    debugPrint('this is route: ${settings.name}');
    switch(settings.name){
      case '/':
        return HomeScreen.route();
      default:
        return _errorRoute();
    }
    
  }
  
  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) =>  Scaffold(
        backgroundColor: const Color.fromARGB(255, 243, 33, 138),
        appBar: AppBar(
          
        ),
        body: const Center(
                child: Text(
                  'ERROR !!!',
                  style: TextStyle(color: Colors.white, fontFamily: 'Arial',fontSize: 48,fontWeight: FontWeight.bold),
                )
              ),
        ),
      );
  }
}