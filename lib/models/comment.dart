import 'package:commerce/models/CommentResponse.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/UserResponse.dart';

class Comment {
  // final newProduct product;
  final int idProduct;
  final Data user;
  // final String date;
  final String text;

  Comment({
    // required this.product,
    required this.idProduct,
    required this.user,
    // required this.date,
    required this.text,
  });
}
Comment convertToComment(Datum data){
  Data userComent=new Data(id: data.userComment.id, username: data.userComment.username, gmail: data.userComment.gmail, phone: data.userComment.phone, password:data.userComment.password, address:data.userComment.address, age:data.userComment.age, isSeller:data.userComment.isSeller, description:data.userComment.description, images:data.userComment.images);
  Comment tempt=new Comment(idProduct: data.productId, user: userComent, text: data.content);

  return tempt;
}
List<Comment>convertToCommentList(List<Datum>data){
  List<Comment> review=[];
  for(int i=0;i<data.length;i++){
    Comment t= convertToComment(data[i]);
    review.add(t);
  }
  return review;
}
List<Comment> review = [
  Comment(
    user: user,
    // date: '',
    text: '', idProduct: 105,


  )
];



