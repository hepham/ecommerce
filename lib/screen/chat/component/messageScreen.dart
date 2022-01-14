import 'dart:async';
import 'dart:convert';
import 'package:quiver/async.dart';
import 'package:commerce/api/chat_Services.dart';
import 'package:commerce/hub/AppHub.dart';
import 'package:commerce/models/ChatRequest.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final Data usersend;
  final int roomId;

  ChatScreen({required this.usersend, required this.roomId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late Timer _timer;

  void startTimer() {
    const oneSec = const Duration(milliseconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (AppHub.isUpdateUI) {
          AppHub.isUpdateUI = false;
          setState(() {});
        }
      },
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  void initState() {
    super.initState();
    this.init();
  }

  Future init() async {
    final chats = await Chat_Services.GetAllMessage(widget.roomId);
    List<Message> mess = [];

    if (mounted)
      setState(() {
        for (int i = 0; i < chats.length; i++) {
          late Message tempt;
          if (chats[i].userId == user.id) {
            user1 = widget.usersend;
            tempt = new Message(
                receive: widget.usersend,
                send: user,
                time: chats[i].createDate.toString(),
                text: chats[i].content);
          } else
            tempt = new Message(
                receive: user,
                send: widget.usersend,
                time: chats[i].createDate.toString(),
                text: chats[i].content);
          mess.add(tempt);
        }
        messages = mess;
        print(messages.length);
      });
  }

  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            MemoryImage(base64Decode(message.send.images)),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage:
                            MemoryImage(base64Decode(message.send.images)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  _sendMessageArea() {
    String values = "";
    final controller = TextEditingController();
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 70,
        color: Colors.white,
        child: TextField(
            controller: controller,
            textCapitalization: TextCapitalization.sentences,
            onChanged: (text) {
              values = text;
            },
            decoration: InputDecoration(
              hintText: 'Send a message ...',
              suffixIcon: IconButton(
                icon: Icon(Icons.send),
                iconSize: 25,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  print(values);
                  // messages.add( Message(
                  //     receive: user1, send: user, time: '', text: values));
                  if (values != "") {
                    messages.insert(
                        0,
                        Message(
                            receive: user1,
                            send: user,
                            time: '',
                            text: values));
                    print(messages[0]);
                    controller.clear();
                    FocusScope.of(context).requestFocus(FocusNode());
                    ChatRequest chatRequest = new ChatRequest(
                        roomId: widget.roomId,
                        userId: user.id,
                        content: values);
                    String tempt = chatRequest.roomId.toString() +
                        "|" +
                        chatRequest.userId.toString() +
                        "|" +
                        chatRequest.content;
                    // print(chatRequest.toJson().toString());
                    // Chat_Services.SendMessage(chatRequest);
                    AppHub.SendMessage(tempt.toString());
                  }
                },
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId = 0;
    startTimer();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: widget.usersend.username,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
          ]),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                final bool isMe = message.send.id == user.id;
                final bool isSameUser = prevUserId == message.send.id;
                prevUserId = message.send.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}
