import 'package:flutter/material.dart';
import 'package:commerce/screen/Sell/tabs/settings/body.dart';

import '../../sell_screen.dart';

class Setting extends StatefulWidget{

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Setting",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => SellScreen(),
              ),
            );
            setState(() {

            });
          },
        ),
      ),
      body: Body(),
    );
  }
}