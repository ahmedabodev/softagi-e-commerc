import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';
import 'package:softage_app/favorites/controller/getfavorites.dart';
import 'package:softage_app/home/controller/home_controller.dart';

class AddReomveFavoritesController extends GetxController{
    final  home_controller=Get.put(Home_Controller());
    final   getfavoritesController=Get.put(GetfavoritesController());

void addremovefavorit({
  String? product_id,
}){
    DioHelper.postData(url: urladdandremovefavorites, body:{
      'product_id':product_id
    },
    Token: token.read('token'),
        lang: (apilang.read('apilang') == null)
            ? 'en'
            : apilang.read('apilang')
    ).then((value) {
      getfavoritesController.getfavorites();
      home_controller.gethome();
      print(value);
      update();
    });
  }
}