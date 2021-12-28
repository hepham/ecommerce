import 'dart:convert';

import 'package:commerce/api/Comment_Services.dart';
import 'package:commerce/models/CommentResponse.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/models/UserResponse.dart';
import 'package:commerce/models/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class productReview extends StatefulWidget {
  const productReview({Key? key, required this.product}) : super(key: key);
  final newProduct product;

  @override
  _productReviewState createState() => _productReviewState();
}

class _productReviewState extends State<productReview> {
  CommentRequest commentRequest=new CommentRequest(productId: 1, userId: 1, content:"check");
  late Future<CommentResponse> futureComment;
  @override
  void initState() {
    super.initState();
    review=[];
    this.init();

  }
  Future init() async{
    final comments=await Comment_Services.getComment(widget.product.id);
    if(mounted) setState(() {
        print(comments.data.length);
        review=convertToCommentList(comments.data);
    //    gans list cho nay nua la xong
    });
  }
  _sendCommentArea() {
    String values = "";

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Send a comment..',
              ),
              textCapitalization: TextCapitalization.sentences,
              onChanged: (text){
                values = text;
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {

              print(values);
              if(values!=""){
                commentRequest.content=values;
                print(commentRequest.content);
                commentRequest.userId=user.id;
                commentRequest.productId=widget.product.id;
                bool check=false;
                Comment_Services comment_services=new Comment_Services();
                Comment_Services.CreateComment(commentRequest).then((value) async{
                  print(value);
                  if (value== 'success') {
                     init();

                  }
                });


                // review.add(Comment(
                //   // product: widget.product,
                //
                //   user: user,
                //   // date:'';
                //   text: values, idProduct: widget.product.id,
                // ));

                setState(() {

                });
              }

            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Scaffold(
          body: ListView.builder(
              itemCount: review.length,
              itemBuilder: (BuildContext context, int index) {
                final Comment chat = review[index];
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundImage: MemoryImage(base64Decode((chat.user.images))),
                        ),
                        padding: EdgeInsets.all(2),
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
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
                                      chat.user.username,
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
                                chat.text,
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
                );
              }),
          bottomSheet: (_sendCommentArea()),
        ));
  }
}
