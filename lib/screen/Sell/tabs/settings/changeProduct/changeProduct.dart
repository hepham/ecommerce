import 'package:commerce/component/navigationBar.dart';
import 'package:flutter/material.dart';

import '../../../../../enums.dart';

import '../setting.dart';
import 'body.dart';


class ChangeProduct extends StatefulWidget{

  @override
  State<ChangeProduct> createState() => _ChangeProductState();
}

class _ChangeProductState extends State<ChangeProduct> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Change Product Detail",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => Setting(),
              ),
            );
            setState(() {

            });
          },
        ),
      ),

      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.sell),
      body: Body(),
    );
  }
}