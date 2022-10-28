import 'package:get/get.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';
import 'package:softage_app/favorites/model/favoritemodel.dart';

class GetfavoritesController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
getfavorites();
    super.onInit();
  }
  myfavorit? favorit;
  void getfavorites(){
    DioHelper.getData(url: urlgetfavorites,Token: token.read('token'),
        lang: (apilang.read('apilang') == null)
            ? 'en'
            : apilang.read('apilang')
    ).then((value) {
      favorit=myfavorit.forJson(value.data);
      update();
      print(favorit);
    });
  }

}