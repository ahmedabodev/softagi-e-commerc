import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:softage_app/cart/controller/addcart_controller.dart';
import 'package:softage_app/cart/controller/indicator_controller.dart';
import 'package:softage_app/home/controller/home_controller.dart';
import 'package:softage_app/home/view/screens/homescreen.dart';

class DescriptionScreen extends StatelessWidget {
   final AddCart_Controller addCart_Controller= Get.put(AddCart_Controller());
   final  indicatorController =Get.put(IndicatorController());

   String? description;
  String? id;
  String? name;
  String? price;
  String? old_price;
  List<String>?images;
  @override
  Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: ()async{
          Home_Controller().descriptionindicator(0);
          Home_Controller().indicator(0);
          return true;
        },
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30.h,
              width: MediaQuery.of(context).size.width.w,
              decoration:  ShapeDecoration(
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset:const Offset(0,3),
                  ),
                ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                gradient:const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff667EEA),
                      Color(0xff64B6FF),
                    ]
                ),),
              child: MaterialButton(
                onPressed: (){
                  addCart_Controller.addtocart(productid: id);

                },
                elevation: 10,
                child:  Text('Add To Cart'.tr(),style: TextStyle(
                  fontFamily: 'Segoe',
                  color: Colors.white

                ),),
              ),
            ),
          ),
          appBar: AppBar(
            leading: IconButton(onPressed: () {
              indicatorController.descriptionindicator(0);
              indicatorController.indicator(0);
              Get.back();
            },
            icon: const Icon(Icons.arrow_back,color: Colors.black,)),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GetBuilder<Home_Controller>(builder: ( controller) {
                    return (controller.home==null)?const Center(child: CircularProgressIndicator(),):
                    CarouselSlider.builder(
                      itemCount: images!.length ,
                      options:CarouselOptions(
                        height:150,
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
                          indicatorController.descriptionindicator(value);
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int indd, int realIndex) {
                        return ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                          child: Image.network(images![indd],
                            fit: BoxFit.contain,

                          ),
                        );
                      },

                    );
                  },),
                  GetBuilder<IndicatorController>(builder: ( controller) {
                    return Center(
                      child: DotsIndicator(
                        dotsCount:images!.length,
                        decorator: const DotsDecorator(
                            activeColor: Colors.black
                        ),
                        position:controller.indcadescription.floorToDouble(),
                      ),
                    );
                  },),
                  const SizedBox(height: 5,),
                  Text(name.toString(),style: const TextStyle(
                    fontFamily: 'Segoe',

                  ),),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Text('\$${price}',style: const TextStyle(
                          color: Colors.blue,
                        fontFamily: 'Segoe',

                      ),),
                      const SizedBox(width: 20,),
                      Text('\$${old_price}',style: const TextStyle(
                          color: Colors.black,
                        fontFamily: 'Segoe',

                        fontSize: 10,
                        decoration: TextDecoration.lineThrough,

                      ),),

                    ],
                  ),
                  const SizedBox(height: 10,),

                  Divider(),
                  const Text('description:',style: TextStyle(
                    fontFamily: 'Segoe',
                    fontSize: 20

                  ),),
                  Text(description.toString(),style: const TextStyle(
                    fontFamily: 'Segoe',

                  ),),
                  const SizedBox(height: 50,),

                ],
              ),
            ),
          ),

        ),
      );
  }

   DescriptionScreen({
    this.description,
    this.name,
    this.price,
    this.old_price,
     this.id,
    this.images,
  });
}
