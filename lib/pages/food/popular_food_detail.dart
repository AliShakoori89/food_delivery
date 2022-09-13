import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_column.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
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
          //icon widgets
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              )),
          //introduction of food
          Positioned(
            left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize-30  ,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, top: Dimensions.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimensions.radius20),
                    topLeft: Radius.circular(Dimensions.radius20)
                  ),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: 'Chinese Side',),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduce",),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "The best sweet dessertThe quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.The quality and craftsmanship is on full show. The waiters  signature white tunics are of loosely rumpled linen here versus the crisp whites of the city. The thick galleria walls of the restaurant s three distinct areas are cast in gentle neon so that even your worst wine-fuelled photos turn into atmospheric still lifes. The art, typically, lands a gut punch.From the Bill Henson portraits at the St Kilda restaurant to Shaun Gladwell s beautiful video artworks at Citta, Di Stasio doesn t use pieces to decorate but to provoke. On entry, a bronze cast of Di Stasio s hands jutt out of the wall, immortalised in the sign of the bull – equal parts a rock star welcome and a warning. A trio of powerful works by Kamilaroi artist Reko Rennie, titled Genesis, goes straight for the jugular of unceded sovereignty.")))
                  ],
                ),
          )),
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
          top:  Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white
              ),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add, color: AppColors.signColor,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20
              ),
              child: BigText(text: "\$10 | Add to card",),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor
              ),
            )
          ],
        ),
      ),
    );
  }
}
