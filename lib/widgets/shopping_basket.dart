import 'package:flutter/material.dart';
import 'package:plants/colors.dart' as AppColors;

class ShoppingBasket extends StatelessWidget {
  final bool inverted;

  ShoppingBasket({
    this.inverted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 70.0,
          width: 70.0,
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.0)),
                    color: inverted
                        ? AppColors.secondColor.withAlpha(75)
                        : Colors.white.withAlpha(30),
                  ),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 5,
          right: 5,
          child: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              color: !inverted ? Colors.white : AppColors.mainColor,
            ),
            child: Center(
              child: Text(
                '7',
                style: TextStyle(
                  color: inverted ? Colors.white : AppColors.mainColor,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
