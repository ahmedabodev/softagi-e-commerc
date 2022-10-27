import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:softage_app/address/controller/deleteaddress.dart';
import 'package:softage_app/address/controller/getaddresscontroller.dart';
import 'package:softage_app/address/view/screens/createaddress.dart';
import 'package:softage_app/order/controller/addorder.dart';
enum Fruit { yes, no }

class SelectAddressScreen extends StatelessWidget {
   SelectAddressScreen({Key? key}) : super(key: key);
   final  getAddressController=Get.put(GetAddressController());
   final   deleteAddressController=Get.put(DeleteAddressController());
   final    addOrderController=Get.put(AddOrderController());
   Fruit? _fruit = Fruit.yes;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
         GetBuilder<GetAddressController>(builder: ( controller) {
              return    (controller.address==null)?const Center(child: Text('no address here')): Expanded(
                child: ListView.builder(
                  itemCount: controller.address!.listAddress!.address.length,
                  itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    // Specify a key if the Slidable is dismissible.
                    key: const ValueKey(0),

                    // The start action pane is the one at the left or the top side.
                    startActionPane: ActionPane(
                      extentRatio: 1.0,

                      // A motion is a widget used to control how the pane animates.
                      motion: const DrawerMotion(),

                      // A pane can dismiss the Slidable.

                      dismissible: DismissiblePane(onDismissed: () {

                      }),
                      // All actions are defined in the children parameter.
                      children:  [
                        // A SlidableAction can have an icon and/or a label.
                        SlidableAction(

                          onPressed: (context){
                            deleteAddressController.deleteaddress(idaddress: controller.address!.listAddress!.address[index].id.toString());

                          },
                          backgroundColor: const Color(0xFFFE4A49),
                          foregroundColor: Colors.white,
                          icon: Icons.close,
                          padding: EdgeInsets.symmetric(vertical: 20),
                          label: 'Delete',
                        ),
                      ],
                    ),

                    // The end action pane is the one at the right or the bottom side.

                    // The child of the Slidable is what the user sees when the
                    // component is not dragged.
                    child: InkWell(
                      // onTap: (){
                      //   controller.changeaddress(controller.address!.listAddress!.address[index].id.toString(), index);
                      // },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(controller.address!.listAddress!.address[index].name.toString()),
                                    Text(controller.address!.listAddress!.address[index].city.toString()),
                                    Text(controller.address!.listAddress!.address[index].region.toString()),
                                    Text(controller.address!.listAddress!.address[index].details.toString()),
                                    Text(controller.address!.listAddress!.address[index].notes.toString()),
                                  ],
                                ),
                                Radio<Fruit>(
                                  value:(controller.checkbox==index)?Fruit.yes: Fruit.no,
                                  groupValue: _fruit,
                                  onChanged: ( value) {
                                    controller.changeaddress(controller.address!.listAddress!.address[index].id.toString(), index);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },),
              );
            },),
            GetBuilder<GetAddressController>(builder: ( controller) {
              return Center(
                child: Column(
                  children: [
                    Padding(
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
                                Color(0xff64B6FF),
                                Color(0xff667EEA),
                              ]
                          ),),
                        child: MaterialButton(
                          onPressed: (){
                            Get.to(()=>CreateAddressScreen());
                          },
                          elevation: 10,
                          child:  Text('Add Address'.tr(),style: const TextStyle(
                            fontFamily: 'Segoe',
                            color: Colors.white

                          ),),
                        ),
                      ),
                    ),
                    (controller.checkbox==null)?Text('Please Add Your Address'.tr()):Padding(
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
                            addOrderController.addorder(address_id: controller.addressid);
                          },
                          elevation: 10,
                          child:  Text('Continue To Payment'.tr(),style: const TextStyle(
                            fontFamily: 'Segoe',
                            color: Colors.white

                          ),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              );
            },),
          ],
        ),
      ),
    );
  }
}
