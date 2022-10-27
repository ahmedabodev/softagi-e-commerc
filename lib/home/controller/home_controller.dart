import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';
import 'package:softage_app/home/model/home-model.dart';

class Home_Controller extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    gethome();
    super.onInit();
  }

  int indca = 0;
  int indcadescription = 0;

  indicator(value) {
    indca = value;
    update();
  }

  descriptionindicator(value) {
    indcadescription = value;
    update();
  }

  Home? home;

  void gethome() {
    DioHelper.getData(
            url: urlhome,
            Token: token.read('token'),
            lang: (apilang.read('apilang') == null)
                ? 'en'
                : apilang.read('apilang'))
        .then((value) {
      home = Home.fromJson(value.data['data']);
      update();
      print(home);
    });
  }
}
