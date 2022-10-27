import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:softage_app/const/const.dart';
import 'package:softage_app/localization/controller/language_controller.dart';
import 'package:softage_app/profile/view/screens/profilescreen.dart';
import 'package:softage_app/profile/view/screens/updateprofile.dart';

class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);
   final  langugae_controller=Get.put(Langugae_controller());
  final List<String> items = [
    'Arabic',
    'English',
  ];
  final List<String> itemsarabic = [
    'العربيه',
    'الانجليزيه',
  ];
  String? selectedValue='English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            // langugae_controller.dropname.remove('dropname');
          }, icon:Icon(Icons.add))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            ProfileScreen(),
            const SizedBox(height: 10,),
            GetBuilder<Langugae_controller>(builder: ( controller) {
              return  ListTile(
                leading:  Text('Change Language'.tr()),
                trailing: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    alignment: Alignment.center,
                    itemHeight: 35,
                    selectedItemHighlightColor: Colors.blueGrey,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.white,
                    ),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.blueGrey,
                      ),
                      color: Colors.transparent,
                    ),
                    hint: const Text(
                      'Change Language',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    items:items
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        )).toList(),
                    value:(dropname.read('dropname')==null)?selectedValue: dropname.read('dropname'),
                    onChanged: (value) {
                      if(value.toString()==dropname.read('dropname')){

                      }else if(dropname.read('dropname')==null&&value.toString()=='English'){

                      }
                      else{
                        controller.changelanguage(context);

                      }


                    },

                  ),
                ),
              );

            },),
            const SizedBox(height: 10,),
            ListTile(
              onTap: (){
                Get.to(()=>UpdateProfileScreen());
              },
              tileColor: Colors.blueGrey,

              leading: Text('Update Profile'.tr()),
              trailing: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
