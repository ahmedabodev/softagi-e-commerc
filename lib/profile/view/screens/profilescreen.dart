import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softage_app/profile/controller/getprofilecontroller.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({Key? key}) : super(key: key);
   final  getProfileController=Get.put(GetProfileController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GetProfileController>(builder: ( controller) {
      return (controller.profile==null)?const SizedBox():  Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(controller.profile!.image.toString()),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(controller.profile!.name,style: const TextStyle(
                    fontFamily: 'Segoe',
                    fontSize: 20,
                    fontWeight: FontWeight.bold

                  ),),
                  Text(controller.profile!.email,style: const TextStyle(
                    fontFamily: 'Segoe',
                    fontSize: 15
                  ),),
                ],
              ),
            ),
          ],
        ),
      );
    },);
  }
}
