
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:softage_app/address/controller/getaddresscontroller.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';

class AddAdressController extends GetxController{
  final  getAddressController=Get.put(GetAddressController());


  void addadress(
  {
  String? name,
  String? city,
  String? notes,
  String? details,
  String? region,
  String? longitude,
  String? latitude,
}
      ){
    DioHelper.postData(
        url: urladdadress,
        body:{
          "name":name,
          "city":city,
          "notes":notes,
          "details":details,
          "region":region,
          "longitude":longitude,
          "latitude":latitude,},
      Token: token.read('token'),
      lang: 'en'
    ).then((value) {
      getAddressController.getaddress();
      update();
      print(value);
    });
  }


}