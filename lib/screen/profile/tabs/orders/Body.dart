import 'package:commerce/api/Order_Service.dart';
import 'package:commerce/api/apiResponse.dart';
import 'package:commerce/models/cart.dart';
import 'package:commerce/screen/Cart/CartScreen.dart';
import 'package:commerce/screen/Cart/component/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:commerce/models/cart.dart';

import '../../../../config.dart';
import 'package:commerce/models/UserResponse.dart';


class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<cart> CartList=[];
  void initState(){

    super.initState();
    this.init();
  }
  Future init()async{
    List<cart> TemptList=[];
    print(user.id);
    final carts=await Order_Service().getListOrderUser(user.id);
    for(int i=0;i<carts.length;i++){
      var product=await ProductApi.GetProductById(carts[i].productId);
      print(product.title_name);
      cart tempt=new cart(product: product,numOfItems: carts[i].quantity,idOrder: carts[i].id, IdBuy: user.id,);
      TemptList.add(tempt);

    }
    if(mounted)setState(() {
      this.CartList=TemptList;
      demoCart=TemptList;
    });
    print(CartList.length);
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: CartList.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: UniqueKey(),
            // key: Key(demoCart[index].product.id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                var deleteOrder = Order_Service.deleteOrder(CartList[index].idOrder);
                CartList.removeAt(index);
                demoCart=CartList;
                print(CartList.length);

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(' delete a item')));


              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartItem(Cart: CartList[index]),
          ),
        ),
      ),

    );
  }
}
