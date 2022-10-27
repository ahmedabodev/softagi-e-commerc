import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:softage_app/address/model/addressmodel.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';

class GetAddressController extends GetxController{
  GetAddressController(){
    getaddress();
  }
  int? checkbox;
  String? addressid;
  changeaddress(id,index){
    checkbox=index;
    addressid=id;
    update();
  }
  Myaddress? address;
  void getaddress(){
    DioHelper.getData(url: urlagetadress,Token: token.read('token'),lang: 'en').then((value){
      address=Myaddress.fromJson(value.data);
      print(address);
      update();
    });
  }

}