import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:softage_app/cart/model/cartmodel.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';
import 'package:softage_app/home/model/home-model.dart';

class GetCart_Controller extends GetxController{
@override
  void onInit() {
  // TODO: implement onInit
  getcart();
    super.onInit();
  }
  int? cartlength;
  double? total;
  Cart? cart;
  // List<products>product=[];

  void getcart(){
    DioHelper.getData(url: urlgettocart,Token: token.read('token'),lang:(apilang.read('apilang')==null)? 'en':apilang.read('apilang')).then((value){
      // for(int x=0;x<value.data['data']['cart_items'].length;x++){
      //   cart.add(Cart.fromJson(value.data['data']['cart_items'][x]));
      // }
      cart=Cart.fromJson(value.data);
      print(cart);
      update();
    });
  }

}