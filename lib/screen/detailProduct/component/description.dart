import 'package:commerce/api/User_Service.dart';
import 'package:commerce/api/apiResponse.dart';
import 'package:commerce/api/chat_Services.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/roomChat.dart';
import 'package:commerce/models/roomChatRequest.dart';
import 'package:commerce/screen/chat/component/messageScreen.dart';
import 'package:commerce/screen/detailProduct/component/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class productDecription extends StatefulWidget {
  const productDecription({Key? key, required this.product, this.pressOneMore})
      : super(key: key);
  final newProduct product;
  final GestureTapCallback? pressOneMore;

  @override
  State<productDecription> createState() => _productDecriptionState();
}

class _productDecriptionState extends State<productDecription> {
  bool isMore = false;
  int index = 2;
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
        top: 10.0,
        right: 10.0,
        child: GestureDetector(
          onTap: () {
            setState(() {
              widget.product.isFavourite = !widget.product.isFavourite;
              ProductApi.UpdateProduct(widget.product);
            });
          },
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: widget.product.isFavourite
                    ? Color(0xFFFFE6E6)
                    : Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/Heart.svg",
                color: widget.product.isFavourite
                    ? Color(0xFFFF4848)
                    : Color(0xFFDBDEE4),
                height: getProportionateScreenWidth(16),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        top: 60.0,
        right: 10.0,
        child: GestureDetector(
          onTap: () async {
            bool check=false;
            final tempt=await User_Service.GetUserbyId(widget.product.user_id);
            for (int i = 0; i < roomchat.length; i++)
            {
              print("roomchat 1:"+roomchat[i].user1.id.toString());
              print("roomchat 2:"+roomchat[i].user2.id.toString());
              print("seller id: " +widget.product.user_id.toString());
              if ((widget.product.user_id == roomchat[i].user1.id)) {
                print(roomchat[i].user1.id);
                check=true;
                print(check);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      usersend: tempt,
                      roomId: roomchat[i].roomid,
                    ),
                  ),
                );
                break;
              }
            }

            if(check ==false){
              print(widget.product.user_id);
              print(user.id);
              RoomChatRequest roomChatRequest = new RoomChatRequest(
                  userOneId: widget.product.user_id, userTwoId: user.id);
              Chat_Services chat_Services=new Chat_Services();
              chat_Services.createRoomChat(roomChatRequest).then((value)async{
                print(value);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(
                      usersend: tempt,
                      roomId:value,
                    ),
                  ),
                );
              });
            }



          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              width: getProportionateScreenWidth(50),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/Mail.svg",
                color: Color(0xFFFF4848),
                height: getProportionateScreenWidth(16),
              ),
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //hien thi tieu de san pham bạn thêm cái row ở đây để chèn cái icon message kìa

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(
              widget.product.title_name,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),

          //hien thi gia san pham

          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(
              widget.product.price.toString(),
              style: TextStyle(
                color: Colors.redAccent,
                fontSize: 18,
              ),
            ),
          ),

          // hien thi mieu ta san pham

          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64),
              bottom: 50,
            ),
            child: isMore
                ? Text(
                    widget.product.description,
                  )
                : Text(
                    widget.product.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              isMore = !isMore;
            }),
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(20),
                    right: getProportionateScreenWidth(64)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    isMore ? "View Less" : "View More",
                    style: TextStyle(color: Colors.redAccent, fontSize: 10.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
