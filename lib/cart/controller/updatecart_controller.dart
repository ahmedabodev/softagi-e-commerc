import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:softage_app/cart/controller/getcart_controller.dart';
import 'package:softage_app/cart/controller/indicator_controller.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';

class UpdateCardController extends GetxController {
  final  getCartController =Get.put(GetCart_Controller());
  void updateCard({
    int? id,
    int? quantity,
  }) {
    DioHelper.putData(
            url: urlupdatecart+id.toString(),
            body: {'quantity': quantity},
            Token: token.read('token'),
        lang: (apilang.read('apilang') == null)
            ? 'en'
            : apilang.read('apilang')
    )
        .then((value) {
          print(value);
          Fluttertoast.showToast(
              msg:value.data['message'].toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: const Color(0xff2077ff),
              textColor: Colors.white,
              fontSize: 16.0
          );

          getCartController.getcart();
          update();


    });
  }
}
