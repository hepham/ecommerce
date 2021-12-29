
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/messages.dart';

class Room {
  final int roomid;
  final Data user1;
  final Data user2;
  final String mess;

  Room(
    this.roomid,
    this.user1,
    this.user2,
    this.mess,
  );
}

// dung cai nay thi bi loi String a = messages[messages.length].text;
String a= messages[4].text;

List<Room> roomchat = [
  Room(1, user1, user, a ),


];
