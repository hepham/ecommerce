import 'package:commerce/hub/AppHub.dart';
import 'package:commerce/routes.dart';
import 'package:commerce/screen/Home/component/specialOffer.dart';
import 'package:commerce/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/screen/start/start.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await AppHub.OnCreate();
 //AppHub.SendData();
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
