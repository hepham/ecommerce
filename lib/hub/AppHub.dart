import "dart:convert";
import 'package:commerce/enums.dart';
import 'package:commerce/models/NewMessageResponse.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/messages.dart';
import 'package:commerce/screen/chat/component/body_chatScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:signalr_flutter/signalr_flutter.dart';
import 'package:signalr_netcore/signalr_client.dart';
import 'package:commerce/screen/chat/component/messageScreen.dart';

class AppHub{
  static HubConnection hubConnection = HubConnectionBuilder().withUrl(ApiUrlChatRealTime).build();
  static BodyChat bodyChat = new BodyChat();
  static OnCreate() async {
    // final HubConnection hubConnection = HubConnectionBuilder().withUrl('https://game.dungpham.com.vn/game').build();
    await hubConnection.start();

    if (hubConnection.state == HubConnectionState.Connected) {
      print("Connected");
    }
    else{
      print("Disconnected");
    }

    hubConnection.on("ReceiveMessage", (args){

      String res = args.toString();
      res = res.substring(1);
      res = res.substring(0, res.length - 1);
      print(res);
      NewMessageResponse newmessage=NewMessageResponse.fromJson(jsonDecode(res));
      Message mess;
      if(newmessage.userId!=user.id){

         mess=new Message(receive:user, send: user1, time: newmessage.chat.createDate.toString(), text: newmessage.chat.content);
         messages.insert(
             0,mess);
      }



    });


  }

  static SendMessage(String data) async {
    await hubConnection.invoke("SendMessage", args: <Object>[data]);
  }
}

