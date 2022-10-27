import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:softage_app/address/view/screens/createaddress.dart';
import 'package:softage_app/address/view/screens/selectaddress.dart';
import 'package:softage_app/cart/controller/getcart_controller.dart';
import 'package:softage_app/cart/controller/updatecart_controller.dart';
import 'package:softage_app/home/model/home-model.dart';
import 'package:softage_app/home/view/screens/homescreen.dart';

import '../../controller/addcart_controller.dart';

class CartScreen extends StatelessWidget {
   CartScreen({Key? key}) : super(key: key);
   final  getCartController=Get.put(GetCart_Controller());
   final   updateCardController=Get.put(UpdateCardController());
   final   addCartController=Get.put(AddCart_Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all( 5.0),
        child: GetBuilder<GetCart_Controller>(builder: ( controller) {
         return  (controller.cart==null)?const SizedBox():Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,

           children: [
             const SizedBox(width: 10,),
             Container(
                height: 30.h,
                width:150.w,
                alignment: Alignment.center,
                decoration:  ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.0),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset:const Offset(0,3),
                    ),
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  ),
                child:  Text('${'Total='.tr()}${controller.cart!.total.toInt()}',style: const TextStyle(
                  fontFamily: 'Segoe',
                  fontSize: 15,
                  fontWeight:FontWeight.w600

                ),),
              ),
             Container(
               height: 30.h,
               width: 150.w,
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
                   Get.to(()=>SelectAddressScreen());
                   // addCart_Controller.addtocart(productid: id);
                 },
                 elevation: 10,
                 child:  Text('Buy Now'.tr(),style: const TextStyle(
                   fontFamily: 'Segoe',
                   color: Colors.white
                 ),),
               ),
             ),

           ],
         );
        }),
      ),
      appBar: AppBar(
        title:Text('Cart'.tr(),style: const TextStyle(
          fontFamily: 'Segoe',
          color: Colors.black,
          fontSize: 21,

        ),),
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Get.back();
        },icon: const Icon(Icons.arrow_back,color: Colors.black,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<GetCart_Controller>(builder: ( controller) {
            return(controller.cart==null)?const Center(child: CircularProgressIndicator(),): Expanded(
              child: ListView.builder(

                itemCount: controller.cart!.cartitem!.list.length,
                itemBuilder: (BuildContext context, int index) {
                  var item=controller.cart!.cartitem!.list;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 5),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(item[index].product!.image.toString(),height: 100,width: 100,fit: BoxFit.fill,),
                         const SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item[index].product!.name.toString(),style: const TextStyle(
                                  fontFamily: 'Segoe',

                                ),),
                                Text('\$${item[index].product!.price}',style: const TextStyle(
                                  fontFamily: 'Segoe',
                                  color: Colors.blue

                                ),),
                                const SizedBox(height: 5,),
                                Container(
                                  height: 35,
                                  width: 114,
                                  color: Colors.grey[300],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(onPressed: (){
                                        if(item[index].quantity>1){
                                          updateCardController.updateCard(
                                              id: item[index].id,
                                              quantity: item[index].quantity-1
                                          );
                                        }

                                      },
                                          icon: const Icon(Icons.remove,size: 15,)),
                                      Text(item[index].quantity.toString(),style: const TextStyle(
                                        fontFamily: 'Segoe',

                                      ),),
                                      IconButton(onPressed: (){
                                        updateCardController.updateCard(
                                          id: item[index].id,
                                          quantity: item[index].quantity+1
                                        );
                                      },
                                          icon: const Icon(Icons.add,size: 15,)),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(onPressed: (){
                            addCartController.addtocart(
                             productid:  item[index].product!.id.toString()
                            );
                          }, icon: const Icon(Icons.close,size: 20,))
                        ],
                      ),
                    ),
                  ),
                );
              },),
            );
          },),
          const SizedBox(height: 50,),
        ],
      ),
    );
  }
}
