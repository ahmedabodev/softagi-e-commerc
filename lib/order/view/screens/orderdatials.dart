import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:softage_app/home/view/screens/homescreen.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 15),
        child: Container(
          height: 30.h,
          width: MediaQuery.of(context).size.width/1.5.w,
          decoration:  ShapeDecoration(
            shadows: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset:const Offset(0,3),
              ),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
            ),
            gradient:const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff667EEA),
                  Color(0xff64B6FF),
                ]
            ),),
          child: MaterialButton(
            onPressed: (){

                Get.offAll(()=>HomeScreen());


            },
            elevation: 10,
            child:  Text('Back To Home'.tr(),style: const TextStyle(
              fontFamily: 'Segoe',

            ),),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Center(child: SvgPicture.asset('images/LIKE.svg',fit: BoxFit.cover)),
           const SizedBox(height: 50,),
            Text('Confirmation'.tr(),style: const TextStyle(
             color: Colors.black,
             fontSize: 25,
             fontWeight: FontWeight.normal,
             fontFamily: 'Segoe'
           ),),
           const SizedBox(height: 5,),
            Text('You have successfully'.tr(),style: const TextStyle(
             color: Colors.black,
             fontFamily: 'Segoe'
           ),),
           const SizedBox(height: 5,),
            Text('completed your payment procedure'.tr(),style:const TextStyle(
             color: Colors.black,
             fontFamily: 'Segoe'
           ),),

         ],
      ),
    );
  }
}
