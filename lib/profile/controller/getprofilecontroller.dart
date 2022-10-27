
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/diohelper/dio_helper.dart';
import 'package:softage_app/profile/model/profile.dart';

class GetProfileController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    getprofile();
    super.onInit();
  }
Profile? profile;
  void getprofile(){
    DioHelper.getData(url: urlprofile,Token: token.read('token')).then((value){
      profile=Profile.fromJson(value.data['data']);
      update();
    });
  }

}