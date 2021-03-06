import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/screen/profile/profile_screen.dart';

import 'package:flutter/material.dart';


import '../../../enums.dart';
import 'component/body.dart';



class DetailUserScreen extends StatefulWidget {
  const DetailUserScreen({Key? key}) : super(key: key);

  @override
  State<DetailUserScreen> createState() => _DetailUserScreenState();
}

class _DetailUserScreenState extends State<DetailUserScreen> {
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
                builder: (ctx) => ProfileScreen(),
              ),
            );
            setState(() {

            });
          },
        ),

      ),

      body: Body(user: user ,),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.none),
    );
  }
}
