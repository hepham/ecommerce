import 'package:commerce/models/UserResponse.dart';

class Message {
  final Data send;
  final Data receive;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;

  Message({
    required this.receive,
    required this.send,
    required this.time,
    required this.text,

  });
}

Data user1 = new Data(
    id: 1,
    username: 'hepham',
    gmail: '',
    phone: '',
    password: '',
    address: '',
    age: 0,
    isSeller: false,
    description: '',
    images: 'assets/images/avatar.jpg');

List<Message> chats = [
  Message(receive: user, send: user, time: 'time', text: 'text'),
];

List<Message> messages = [
  Message(send: user, receive: user, time: '', text: 'text'),
  Message(send: user1, receive : user, time: '', text: 'a')
 
];