import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:softage_app/auth/controller/login_controller.dart';
import 'package:softage_app/auth/view/widget/text%20form%20field%20passward.dart';

import '../widget/custom_text_form_field.dart';
import 'signup.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   final Login_Controller login_controller=Get.put(Login_Controller());
TextEditingController emailcontroller=TextEditingController();
TextEditingController passwordcontroller=TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                    Text('Login'.tr(),style: const TextStyle(
                    fontFamily: 'Segoe',
                    fontSize: 30,
                  ),),
                  const SizedBox(height: 40,),
                  custom_text_form_field(
                    controller: emailcontroller,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Your Email'.tr();
                      }
                    },
                    hint:'Email'.tr() ,
                  ),
                  const SizedBox(height: 15,),
                  Textformfieldpassward(
                    controller: passwordcontroller,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please Enter Your Password'.tr();
                      }
                    },
                    label: 'Password'.tr(), obscureText: true,
                  ),
                  const SizedBox(height: 40,),
                  GetBuilder<Login_Controller>(builder: ( controller) {
                   return Align(
                     alignment: Alignment.center,
                     child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: 42.h,
                        width:(controller.Loading)?100.w: double.infinity.w,
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
                            if(_formKey.currentState!.validate()){
                              login_controller.Login(
                                  password: passwordcontroller.text,
                                  email: emailcontroller.text
                              );
                            }else{}
                          },
                          child:(controller.Loading)?const Center(child: CircularProgressIndicator(color: Colors.white,),):  Text('Log in'.tr(),style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Segoe',

                              color: Colors.white,
                              fontWeight: FontWeight.normal
                          ),),
                        ),
                      ),
                   );

                  },),
                  const SizedBox(height: 20,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 42.h,
                    width: double.infinity.w,
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

                      },
                      child:   Text('Login With Google'.tr(),style:const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Segoe',

                          color: Colors.white,
                          fontWeight: FontWeight.normal
                      ),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('Don’t have an account? '.tr(),style:const TextStyle(
                      color: Colors.grey,
                        fontFamily: 'Segoe'
                      ),),
                   TextButton(onPressed: (){
                     Get.to(()=>Signup());
                   }, child:  Text('Sign Up'.tr(),style:const TextStyle(
                       fontFamily: 'Segoe',
                       fontSize: 14,
                       color: Colors.black87,
                     fontWeight: FontWeight.normal
                   )))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
