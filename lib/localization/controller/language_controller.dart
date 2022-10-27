import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softage_app/cart/controller/getcart_controller.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/home/controller/home_controller.dart';

class Langugae_controller extends GetxController {
  final  home_controller=Get.put(Home_Controller());
  final   getCart_Controller=Get.put(GetCart_Controller());

  void changelanguage(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == Locale('en', 'US')) {
      context.setLocale(const Locale('ar', 'EG'));
      Get.updateLocale(const Locale('ar', 'EG'));
     dropname.write('dropname', 'Arabic');
       apilang.write('apilang', 'ar');
      home_controller.gethome();
      getCart_Controller.getcart();
      update();
    } else {
      context.setLocale(const Locale('en', 'US'));
      Get.updateLocale(const Locale('en', 'US'));
      dropname.write('dropname', 'English');
      apilang.write('apilang', 'en');

      home_controller.gethome();
      getCart_Controller.getcart();

      update();

    }
 update();
  }
}


