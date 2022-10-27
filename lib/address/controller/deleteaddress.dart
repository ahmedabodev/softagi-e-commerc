import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:softage_app/address/controller/getaddresscontroller.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';

class DeleteAddressController extends GetxController{
  final  getAddressController=Get.put(GetAddressController());


  void deleteaddress({
  String? idaddress,
}){
    DioHelper.deleteData(url: urldeleteadress+idaddress.toString(),Token: token.read('token'),).then((value) {
      print(value);
      getAddressController.getaddress();
      update();
    });
  }
}