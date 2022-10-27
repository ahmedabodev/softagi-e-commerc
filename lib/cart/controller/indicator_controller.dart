import 'package:get/get_state_manager/get_state_manager.dart';

class IndicatorController extends GetxController{
  int indca=0;
  int indcadescription=0;
  indicator(value){
    indca=value;
    update();
  }
  descriptionindicator(value){
    indcadescription=value;
    update();
  }
}