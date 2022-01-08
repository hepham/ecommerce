import 'package:commerce/component/navigationBar.dart';
import 'package:commerce/screen/chat/component/body_chatScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../enums.dart';

class MessageScreen extends StatefulWidget {


  MessageScreen({Key? key}) : super(key: key);
  static String routeName = '/message';

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: 'Message',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ))
          ]),
        ),
      ),

      body: BodyChat(),
      bottomNavigationBar: NavigationBar(selectedMenu: MenuState.message),
    );
  }
}