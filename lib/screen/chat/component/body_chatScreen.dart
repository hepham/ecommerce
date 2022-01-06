import 'dart:convert';

import 'package:commerce/api/chat_Services.dart';
import 'package:commerce/models/roomChat.dart';
import 'package:commerce/models/roomChatResponse.dart';
import 'package:commerce/screen/chat/component/messageScreen.dart';
import 'package:flutter/material.dart';
import 'package:commerce/models/UserResponse.dart';

class BodyChat extends StatefulWidget {
  @override
  State<BodyChat> createState() => _BodyChatState();
}

class _BodyChatState extends State<BodyChat> {
  late List<Room> roomList = [];
  void initState() {
    super.initState();
    this.init();
  }

  Future init() async {
    final lastchat = await Chat_Services.GetAllRoomChat(user.id);
    if (mounted)
      setState(() {
        roomList = convertToListRoom(lastchat);
        this.roomList = roomList;
        roomchat = roomList;
        // print(roomchat[0].user1.id);
        // print(roomchat[0].user2.id);
        print(roomList[0].user1.id);
        print(roomList[0].user2.id);
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: roomList.length,
      itemBuilder: (BuildContext context, int index) {
        final Room room = roomList[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(
                usersend: room.user1,
                roomId: room.roomid,
              ),
            ),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage:
                        MemoryImage(base64Decode(room.user1.images)),
                  ),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ]),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.65,
                  padding: EdgeInsets.only(
                    left: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                room.user1.username,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          room.mess,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
