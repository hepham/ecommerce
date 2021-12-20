
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/screen/chat/messageScreen.dart';
import 'package:flutter/material.dart';

class BodyChat extends StatelessWidget {
  const BodyChat({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        index = 1;

        final Data chat = user;
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, ChatScreen.routeName),

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
                    backgroundImage: AssetImage(user.image),
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
                                chat.username,
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
                          chat.username,
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