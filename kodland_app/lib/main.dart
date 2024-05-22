import 'package:kodland_app/config/app_router.dart';
import 'package:kodland_app/config/theme.dart';
import 'package:kodland_app/screens/screens.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    HomeScreen.tapedcustomFilterId.value = 0;
    HomeScreen.tapedCourseId = 0;
    return MaterialApp(
      title: 'Kodland',
      theme: theme(),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
      home: const HomeScreen(),
    );
  }
}



