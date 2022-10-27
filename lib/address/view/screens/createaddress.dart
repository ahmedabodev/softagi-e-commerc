import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:softage_app/address/controller/addadress.dart';
import 'package:softage_app/address/controller/getaddresscontroller.dart';
import 'package:softage_app/address/view/widget/customtextfieldaddress.dart';

class CreateAddressScreen extends StatefulWidget {
   CreateAddressScreen({Key? key}) : super(key: key);

  @override
  State<CreateAddressScreen> createState() => _CreateAddressScreenState();
}

class _CreateAddressScreenState extends State<CreateAddressScreen> {
   final  addAdressController=Get.put(AddAdressController());

   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

   final  getAddressController=Get.put(GetAddressController());

   TextEditingController namecontroller=TextEditingController();

   TextEditingController notescontroller=TextEditingController();

   TextEditingController detailscontroller=TextEditingController();

   TextEditingController citycontroller=TextEditingController();

   TextEditingController regioncontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
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
              if(_formKey.currentState!.validate()){
                addAdressController.addadress(
                  name: namecontroller.text,
                  city: citycontroller.text,
                  region: regioncontroller.text,
                  details:detailscontroller.text,
                  notes: notescontroller.text,
                  latitude: '30.0616863',
                  longitude:'31.3260088',
                );
                Get.back();
              }else{

              }

            },
            elevation: 10,
            child:  Text('Add Address'.tr(),style:const TextStyle(
              fontFamily: 'Segoe',
              color: Colors.white

            ),),
          ),
        ),
      ),
      appBar: AppBar(
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child:GetBuilder<GetAddressController>(builder: ( controller) {
              // (namecontroller.text.isEmpty&&controller.address!=null)?namecontroller.text=controller.address!.listAddress!.address[0].name:namecontroller.text;
              // (citycontroller.text.isEmpty&&controller.address!=null)?citycontroller.text=controller.address!.listAddress!.address[0].city:citycontroller.text;
              // (regioncontroller.text.isEmpty&&controller.address!=null)?regioncontroller.text=controller.address!.listAddress!.address[0].region:regioncontroller.text;
              // (detailscontroller.text.isEmpty&&controller.address!=null)?detailscontroller.text=controller.address!.listAddress!.address[0].details:detailscontroller.text;
              // (notescontroller.text.isEmpty&&controller.address!=null)?notescontroller.text=controller.address!.listAddress!.address[0].notes:notescontroller.text;

              return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15,),
                   Text('Create Address'.tr(),style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Segoe',
                      fontSize: 21
                  ),),

                  const SizedBox(height: 15,),
                  //name
                  SizedBox(
                    child: custom_text_form_fieldAddress(
                      textname: 'Name'.tr(),
                      hint: 'Enter your Name'.tr(),
                      controller: namecontroller,

                      validator: (value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Name'.tr();
                        }

                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //city
                  SizedBox(
                    child: custom_text_form_fieldAddress(
                      textname: 'City'.tr(),
                      hint: 'Enter your City'.tr(),
                      controller: citycontroller,
                      validator:(value){
                        if(value!.isEmpty){
                          return 'Please Enter Your City'.tr();
                        }

                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  //region
                  SizedBox(
                    child: custom_text_form_fieldAddress(
                      textname: 'region'.tr(),
                      hint: 'Enter your region'.tr(),
                      controller: regioncontroller,
                      validator:(value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Region'.tr();
                        }

                      },

                    ),
                  ),
                  const SizedBox(height: 10,),
                  //details
                  SizedBox(
                    child: custom_text_form_fieldAddress(
                      textname: 'details'.tr(),
                      hint: 'Enter your details'.tr(),
                      controller: detailscontroller,
                      validator:(value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Details'.tr();
                        }

                      },

                    ),
                  ),
                  const SizedBox(height: 10,),
                  //notes
                  SizedBox(
                    child: custom_text_form_fieldAddress(
                      textname: 'Note'.tr(),
                      hint: 'Enter your Note'.tr(),
                      controller: notescontroller,
                      validator:(value){
                        if(value!.isEmpty){
                          return 'Please Enter Your Note'.tr();
                        }

                      },

                    ),
                  ),

                ],
              );
            },),
          ),
        ),
      ),
    );
  }
}
