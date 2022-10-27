import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:softage_app/diohelper/dio_helper.dart';
import 'package:softage_app/profile/controller/getprofilecontroller.dart';

import '../../const/const.dart';

class UpdateProfileController extends GetxController{
  final GetProfileController getProfileController=Get.put(GetProfileController());
bool Loading=false;
  void updateprofile({
  String? name,
  String? phone,
  String? email,
  String? password,
  String? image,
}){
    Loading=true;
    update();
    DioHelper.putData(Token: token.read('token'),url: urlupdateprofile, body: {
      "name": name,
      "phone": phone,
      "email":email ,
      "password": password,
    "image":image,
    },
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
        Get.back();
        getProfileController.getprofile();

      }
      print(value);
      Loading=false;
      update();
    });
  }


}