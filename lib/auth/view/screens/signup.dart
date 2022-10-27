import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:softage_app/auth/controller/signup_controller.dart';
import 'package:softage_app/auth/view/screens/loginscreen.dart';
import 'package:softage_app/auth/view/widget/custom_text_form_field.dart';
import 'package:softage_app/auth/view/widget/text%20form%20field%20passward.dart';
import 'package:softage_app/const/const.dart';

import '../widget/imagepicker.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);
  final Signup_controller signup_controller=Get.put(Signup_controller());
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController namecontroller=TextEditingController();
  TextEditingController phonecontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  const SizedBox(height: 40,),

                    Text('Sign Up'.tr(),style:const TextStyle(
                    fontFamily: 'Segoe',
                    fontSize: 30,
                  ),),
                  const SizedBox(height: 40,),
                  SizedBox(
                    child: custom_text_form_field(
                      controller: namecontroller,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Name'.tr();
                        }
                      },
                      hint:'Name'.tr(),
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    child: custom_text_form_field(
                      controller: emailcontroller,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Email'.tr();
                        }
                      },
                      hint:'Email'.tr(),
                    ),
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
                  SizedBox(
                    child: custom_text_form_field(
                      phone: true,
                      keyboardType:TextInputType.phone ,
                      controller: phonecontroller,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Phone Number'.tr();
                        }
                      },
                      hint:'Phone'.tr(),
                    ),
                  ),
                  const SizedBox(height: 15,),

                  CameraScreen(),
                  const SizedBox(height: 40,),
                  GetBuilder<Signup_controller>(builder: ( controller) {
                    return  Align(
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
                              signup_controller.signup(
                                  image: photo,
                                  email: emailcontroller.text,
                                  name: namecontroller.text,
                                  password: passwordcontroller.text,
                                  phone: phonecontroller.text
                              );

                            }else{}
                          },
                          child:(controller.Loading)?const Center(child: CircularProgressIndicator(color: Colors.white),):   Text('Sign Up'.tr(),style:const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Segoe',

                              color: Colors.white,
                              fontWeight: FontWeight.normal
                          ),),
                        ),
                      ),
                    );

                  },),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('Already have an account? '.tr(),style:const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Segoe'
                      ),),
                      TextButton(onPressed: (){
                        Get.offAll(()=>LoginScreen());
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
