import 'dart:io';

import 'package:commerce/screen/Sell/tabs/MyShop/myshop.dart';
import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config.dart';

class AddProduct extends StatefulWidget{


  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late File _image = null as File;

  Future getCameraImage() async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    File file = File( picture!.path );
    setState(() {
      _image = file;
    });
  }

  Future getGalleryImage() async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File( picture!.path );
    setState(() {
      _image = file ;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => MyShop(),
              ),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Column(
            children: <Widget>[
              SizedBox(height: 60),
              SizedBox(
                height: 170,
                width: 170,
                child: Stack(
                  fit: StackFit.expand,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: _image != null
                          ? FileImage(_image)
                          : AssetImage("assets/images/technology.jpg")
                      as ImageProvider,
                    ),
                    Positioned(
                      right: -12,
                      bottom: 0,
                      child: SizedBox(
                        height: 46,
                        width: 46,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          ProfileMenu(
            text: "From Gallery",
            icon: "assets/icons/User.svg",
            press: getGalleryImage,
          ),
          ProfileMenu(
            text: "From Camera",
            icon: "assets/icons/Camera Icon.svg",
            press: getCameraImage,
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: getProportionateScreenWidth(200),
            height: getProportionateScreenHeight(56),
            child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => MyShop(),
                    ),
                  );
                },
                color: Colors.redAccent,
                child: Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getProportionateScreenWidth(18),
                  ),
                )),
          ),
        ],
      ),);

}
}