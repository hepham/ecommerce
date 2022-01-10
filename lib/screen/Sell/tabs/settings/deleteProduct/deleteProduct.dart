import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/screen/Sell/tabs/settings/deleteProduct/body.dart';
import 'package:commerce/screen/Sell/tabs/settings/setting.dart';
import 'package:flutter/material.dart';

import '../../../../../enums.dart';

class DeleteProduct extends StatefulWidget{

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Delete Product",style: TextStyle(color: Colors.white),),
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