import "dart:convert";
import 'package:commerce/enums.dart';
import 'package:commerce/models/NewMessageResponse.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:signalr_flutter/signalr_flutter.dart';
import 'package:signalr_netcore/signalr_client.dart';

class AppHub{
  static HubConnection hubConnection = HubConnectionBuilder().withUrl(ApiUrlChatRealTime).build();

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
      NewMessageResponse newmessage=NewMessageResponse.fromJson(jsonDecode(args.toString()));
      print(args);


    });
    //
    // await hubConnection.invoke("SendMessage", args: <Object>["0", "kerhoangde|dungdeptrai"]);
  }

}

