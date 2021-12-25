import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/UserResponse.dart';

class Comment {
  final newProduct product;
  final Data user;
  final String date;
  final String text;

  Comment({
    required this.product,
    required this.user,
    required this.date,
    required this.text,
  });
}

List<Comment> review = [
  Comment(
    product : demoProducts[1],
    user: user,
    date: '',
    text: ''


  )
];



