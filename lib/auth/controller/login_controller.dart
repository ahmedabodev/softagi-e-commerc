import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';
import 'package:softage_app/home/view/screens/homescreen.dart';

class Login_Controller extends GetxController{
bool Loading=false;
  void Login({
  String? email,
  String? password,
})async{
    Loading=true;
    update();
    DioHelper.postData(url:urllogin, body: {
      'email':email,
      'password':password
    },
        lang: (apilang.read('apilang') == null)
            ? 'en'
            : apilang.read('apilang')
    ).then((value){
      if(value.data['status']==false){
        Fluttertoast.showToast(
            msg:value.data['message'].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xff2077ff),
            textColor: Colors.white,
            fontSize: 16.0
        );

      }else{
        Fluttertoast.showToast(
            msg:value.data['message'].toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color(0xff2077ff),
            textColor: Colors.white,
            fontSize: 16.0
        );
        // Get.offAll(()=>LoginScreen());
        token.write('token', value.data['data']['token']);
        Get.offAll(()=>HomeScreen());
      }
      print(value);
      Loading=false;
      update();
    });

  }

}