import 'dart:io';


import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../profile_screen.dart';
import 'changeUserName/changeusername.dart';

class ChangeAvatar extends StatefulWidget{
  @override
  State<ChangeAvatar> createState() => _ChangeAvatarState();
}

class _ChangeAvatarState extends State<ChangeAvatar> {
  late File image;

  Future getCameraImage()async {
    final picture = await ImagePicker().pickImage(source: ImageSource.camera);
    setState((){
      image = picture as File;
    });
  }

  Future getGalleryImage()async {
    final picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState((){
      image = picture as File;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                builder: (ctx) => ProfileScreen(),
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
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
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

        ],
      ),
    );
  }
}