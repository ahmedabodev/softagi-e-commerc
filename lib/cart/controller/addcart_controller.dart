import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:softage_app/cart/controller/getcart_controller.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';

class AddCart_Controller extends GetxController{
  final GetCart_Controller getCart_Controller=Get.put(GetCart_Controller());
  void addtocart({
  String? productid,
}){
    DioHelper.postData(url: urladdtocart, body:{
      'product_id':productid
    },Token: token.read('token')).then((value) {
      getCart_Controller.getcart();
      Fluttertoast.showToast(
          msg:value.data['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xff2077ff),
          textColor: Colors.white,
          fontSize: 16.0
      );

      update();
      print('mycart'+value.toString());
    });
  }
  
}