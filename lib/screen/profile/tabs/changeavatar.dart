import 'dart:io';

import 'package:commerce/screen/profile/component/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

import '../profile_screen.dart';

class ChangeAvatar extends StatefulWidget {
  @override
  State<ChangeAvatar> createState() => _ChangeAvatarState();
}

class _ChangeAvatarState extends State<ChangeAvatar> {
  late File image = null as File;


  Future getCameraImage() async {
    var picture = await ImagePicker().pickImage(source: ImageSource.camera);
    File file = File( picture!.path );
    setState(() {
      image = file;
    });
  }

  Future getGalleryImage() async {
    var picture = await ImagePicker().pickImage(source: ImageSource.gallery);
    File file = File( picture!.path );
    setState(() {
      image = file ;
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
                      backgroundImage: image != null
                          ? FileImage(image)
                          : AssetImage("assets/images/avatar.jpg")
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
        ],
      ),
    );
  }
}
