import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:softage_app/auth/view/screens/loginscreen.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';

class Signup_controller extends GetxController{
  bool Loading=false;
  void signup(
  {
  String? name,
  String? email,
  String? password,
  String? phone,
  String? image,
}
      )async{
    Loading=true;
    update();
print('bl7a'+image.toString());
    FormData  formData = FormData.fromMap({
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      "image":(photo==null)?'':photo
    },

    );
    DioHelper.postData(
        url: urlregister,
        body:formData,
        lang: (apilang.read('apilang') == null)
            ? 'en'
            : apilang.read('apilang')
    ).then((value){
      if(value.data['status']=='false'){
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
        Get.offAll(()=>LoginScreen());

      }

      Loading=false;
      update();
      print('my vlaue'+value.toString());

    });

  }
  
}