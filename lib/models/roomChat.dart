
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/messages.dart';

class Room {
  final int roomid;
  final Data user;
  final String mess;

  Room(
    this.roomid,
    this.user,
    this.mess,
  );
}

String a= messages[1].text;

List<Room> roomchat = [
  Room(1, user1, a ),


];
