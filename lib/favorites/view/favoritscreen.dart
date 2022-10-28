import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:softage_app/favorites/controller/add-remove-favorites.dart';
import 'package:softage_app/favorites/controller/getfavorites.dart';
import 'package:softage_app/home/controller/home_controller.dart';
import 'package:softage_app/home/model/home-model.dart';
import 'package:softage_app/home/view/screens/descriptionscreen.dart';

class FavoritScreen extends StatelessWidget {
   FavoritScreen({Key? key}) : super(key: key);
  final  getfavoritesController=Get.put(GetfavoritesController());
  final  homecontroller=Get.put(Home_Controller());
   final   addReomveFavoritesController=Get.put(AddReomveFavoritesController());

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GetBuilder<GetfavoritesController>(builder: ( controller) {
            return  (controller.favorit==null)?const Center(child: CircularProgressIndicator(),):          Expanded(
              child:ListView.builder(
                itemCount: controller.favorit!.favorit!.favorit.length,
                itemBuilder: (BuildContext context, int index) {
                  var product=controller.favorit!.favorit!.favorit;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5),
                    child:InkWell(
                      onTap: (){
                        homecontroller.indicator(0);
                        Get.to(()=>DescriptionScreen(
                          image: product[index].favo!.image,
                          id:product[index].favo!.id.toString(),
                          description: product[index].favo!.description,
                          name: product[index].favo!.name,
                          old_price: product[index].favo!.old_price.toString(),
                          price: product[index].favo!.price.toString(),
                          images: null,
                        ));
                      },
                      child: Card(

                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.network(product[index].favo!.image,height: 100,width: 100,fit: BoxFit.fill,),
                              Expanded(
                                child: ListTile(

                                  subtitle: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('\$${product[index].favo!.price}',style: const TextStyle(
                                                fontFamily: 'Segoe',

                                                color: Colors.black
                                            ),),
                                            Text('\$${product[index].favo!.old_price}',style: const TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              fontFamily: 'Segoe',

                                            ),),
                                            Text('${product[index].favo!.discount}%',style: const TextStyle(
                                              decoration: TextDecoration.lineThrough,
                                              fontFamily: 'Segoe',

                                            ),),


                                          ],
                                        ),
                                        IconButton(onPressed: (){
                                          addReomveFavoritesController.addremovefavorit(product_id: product[index].favo!.id.toString());
                                        }, icon:const Icon(Icons.favorite,color: Colors.red,))
                                      ],
                                    ),
                                  ),
                                  // leading: Image.network(product[index].image,height: 100,fit: BoxFit.contain,),
                                  title: Text(product[index].favo!.name,style: const TextStyle(
                                    fontFamily: 'Segoe',

                                  ),),

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Card(
                    //   elevation: 5,
                    //
                    //   child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    //     child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const SizedBox(height: 5,),
                    //
                    //         Center(child: Image.network(product[index].image,height: 50,fit: BoxFit.cover)),
                    //         const SizedBox(height: 10,),
                    //         Text('\$'+product[index].price.toString()),
                    //         const SizedBox(height: 5,),
                    //         Text(product[index].name,maxLines: 2,overflow: TextOverflow.ellipsis,),
                    //         const SizedBox(height: 10,),
                    //         IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
                    //
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  );
                }, ),
            );
          },),

        ],
      ),
    );
  }
}
