import 'package:flutter/material.dart';
import 'package:commerce/config.dart';
import 'package:commerce/models/ProductResponse.dart';
import 'package:commerce/component/RoundBtn.dart';

class color extends StatefulWidget {
  const color({Key? key, required this.product}) : super(key: key);
  final newProduct product;

  @override
  State<color> createState() => _colorState();
}


int temp= 1;
class _colorState extends State<color> {
  int selectedColor = 0;int index = 0;


  @override
  Widget build(BuildContext context) {
    temp=index;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          for (var i = 0; i < widget.product.colors.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = i;
                });
              },
              child: colorDot(
                color: widget.product.colors[i],
                isSelected: i == selectedColor,
              ),
            ),
          ...List.generate(
            widget.product.colors.length,
            (index) => colorDot(
              color: widget.product.colors[index],
              isSelected: index == selectedColor,
            ),
          ),
          Spacer(),
          RoundBtn(
            icon: Icons.remove,
            press: () {
              setState(() {
                if (index == 1)
                  index = index;
                else
                  index = index - 1;

                print(index);
              });
            },
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Text('${index}',

          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          RoundBtn(
            icon: Icons.add,
            press: () {
              setState(() {
                index = index + 1;
                print(index);
              });
            },
            showShadow: true,
          ),
        ],
      ),
    );
  }
}

class colorDot extends StatelessWidget {
  const colorDot({Key? key, required this.color, this.isSelected = false})
      : super(key: key);
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: getProportionateScreenWidth(2)),
      padding: EdgeInsets.all(getProportionateScreenWidth(4)),
      height: getProportionateScreenWidth(30),
      width: getProportionateScreenWidth(30),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: isSelected ? Color(0xFFFF7643) : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
