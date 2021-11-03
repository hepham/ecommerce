import 'package:commerce/routes.dart';
import 'package:commerce/screen/Home/component/specialOffer.dart';
import 'package:commerce/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/screen/start/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      initialRoute: start.routeName,
      routes: routes,
    );
  }
}
