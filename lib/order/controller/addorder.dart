import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';
import 'package:softage_app/order/model/ordermodel.dart';
import 'package:softage_app/order/view/screens/orderdatials.dart';

class AddOrderController extends GetxController{
  void addorder({
  String? address_id,
}){
    DioHelper.postData(body: {
      "address_id":address_id,
      "payment_method":"1",
      "use_points":"false",
    },url: urladdorder,Token: token.read('token'),
        lang: (apilang.read('apilang') == null)
            ? 'en'
            : apilang.read('apilang')
    ).then((value) {
      Fluttertoast.showToast(
          msg:value.data['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xff2077ff),
          textColor: Colors.white,
          fontSize: 16.0
      );
      Get.offAll(()=>const OrderScreen());
      update();
      print(value);
    });
  }

}