import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.popularFoodImgSize,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/food1.png"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios
                  )
                ],
              )),
        ],
      ),
    );
  }
}
