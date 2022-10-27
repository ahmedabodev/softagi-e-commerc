import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:softage_app/auth/view/screens/loginscreen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text('Welcome To Softagi'),
          const  Spacer(),
            Center(child: SvgPicture.asset('images/onboarding.svg')),
           const Spacer(),
            Container(
              height: 45.h,
              width: 245.w,
              decoration:  ShapeDecoration(
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset:Offset(0,3),
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
                Get.offAll(()=>LoginScreen());
              },
              child:  const Text('Log in',style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal
                ),),
              ),
            ),
            const SizedBox(height: 10,),
            MaterialButton(
                height: 49.h,
                minWidth: 245.w,
            onPressed: (){},
            child: const Text('Signup',style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal
            ),),
            ),
         const   Spacer(),

          ],
        ),
      ),
    );
  }
}
