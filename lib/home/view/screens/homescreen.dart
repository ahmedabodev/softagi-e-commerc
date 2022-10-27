import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:softage_app/auth/view/screens/loginscreen.dart';
import 'package:softage_app/cart/controller/getcart_controller.dart';
import 'package:softage_app/cart/view/screens/cartscreen.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/home/controller/home_controller.dart';
import 'package:softage_app/home/model/home-model.dart';
import 'package:softage_app/setting/view/screens/settingscreen.dart';

import 'descriptionscreen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
   final  home_controller=Get.put(Home_Controller());
   final  getCart_Controller=Get.put(GetCart_Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(icon:const Icon(Icons.favorite,color: Colors.black,),onPressed: (){
            token.remove('token');
            Get.to(LoginScreen());
          },),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 15.0,bottom: 15.0),
            child: GetBuilder<GetCart_Controller>(builder: ( controller) {
              return InkWell(
                onTap: (){
                  Get.to(()=>CartScreen());

                },
                child: Badge(
                  elevation:(controller.cart!=null)? 2:0,
                  badgeColor:(controller.cart!=null)?  Colors.white:Colors.transparent,
                  alignment: Alignment.topRight,
                  position: BadgePosition.topEnd(),
                  badgeContent:(controller.cart!=null)?  Text(
                    controller.cart!.cartitem!.list.length.toString(),
                    style: const TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.w900,
                    ),
                  ):const SizedBox(),
                  child: const Icon(
                    Icons.shopping_cart,color: Colors.black,
                  ),
                ),
              );

            },),
          ),
          IconButton( onPressed: (){
            Get.to(()=>SettingScreen());
          },icon: const Icon(Icons.settings,color: Colors.black,)),
          const SizedBox(width: 5,),

        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            GetBuilder<Home_Controller>(
              builder: ( controller) {
              return (controller.home==null)?const SizedBox():
              Column(

                children: [
                  CarouselSlider.builder(
                    itemCount: controller.home!.banner.length ,
                    options:CarouselOptions(
                      height:130,
                      viewportFraction:0.9,
                      initialPage: 0,

                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      onPageChanged: ( value,caursol){
                        controller.indicator(value);
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                    itemBuilder: (BuildContext context, int indd, int realIndex) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(controller.home!.banner[indd].image,
                          fit: BoxFit.contain,

                        ),
                      );
                    },

                  ),
              DotsIndicator(
              dotsCount:controller.home!.banner.length ,
              decorator: const DotsDecorator(
                activeColor: Colors.black
              ),
              position:controller.indca.floorToDouble(),
              ),
                ],
              );
            },),
            const SizedBox(height: 10,),
            GetBuilder<Home_Controller>(builder: ( controller) {
              return  (controller.home==null)?const Center(child: CircularProgressIndicator(),):          Expanded(
                child:ListView.builder(
                  itemCount: controller.home!.product.length,
                  itemBuilder: (BuildContext context, int index) {
                    var product=controller.home!.product;
                    return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),
                    child:InkWell(
                      onTap: (){
                        controller.indicator(0);
                        Get.to(()=>DescriptionScreen(
                          id:product[index].id.toString(),
                          description: product[index].description,
                          name: product[index].name,
                          old_price: product[index].old_price.toString(),
                          price: product[index].price.toString(),
                          images: product[index].images,
                        ));
                      },
                      child: Card(

                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.network(product[index].image,height: 100,width: 100,fit: BoxFit.fill,),
                              Expanded(
                                child: ListTile(

                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text('\$${product[index].price}',style: const TextStyle(
                                            fontFamily: 'Segoe',

                                            color: Colors.black
                                        ),),
                                        Text('\$${product[index].old_price}',style: const TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontFamily: 'Segoe',

                                        ),),
                                        Text('${product[index].discount}%',style: const TextStyle(
                                          decoration: TextDecoration.lineThrough,
                                          fontFamily: 'Segoe',

                                        ),),


                                      ],
                                    ),
                                  ),
                                  // leading: Image.network(product[index].image,height: 100,fit: BoxFit.contain,),
                                  title: Text(product[index].name,style: const TextStyle(
                                    fontFamily: 'Segoe',

                                  ),),

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Card(
                    //   elevation: 5,
                    //
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const SizedBox(height: 5,),
                    //
                    //         Center(child: Image.network(product[index].image,height: 50,fit: BoxFit.cover)),
                    //         const SizedBox(height: 10,),
                    //         Text('\$'+product[index].price.toString()),
                    //         const SizedBox(height: 5,),
                    //         Text(product[index].name,maxLines: 2,overflow: TextOverflow.ellipsis,),
                    //         const SizedBox(height: 10,),
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
                    //
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  );
                }, ),
              );
            },),

          ],
        ),
      ),
    );
  }
}
