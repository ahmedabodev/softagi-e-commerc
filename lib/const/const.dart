import 'dart:io';

import 'package:get_storage/get_storage.dart';

String baseurl='https://student.valuxapps.com/api/';
String urlregister='register';
String urllogin='login';
String urlhome='home';
String urlupdateprofile='update-profile';
String urlprofile='profile';
String urlgetfavorites='favorites';
String urladdandremovefavorites='favorites';
String urladdtocart='carts';
String urlgettocart='carts';
String urlupdatecart='carts/';
String urladdorder='orders';
String urlgetorder='orders';
String urladdadress='addresses';
String urlagetadress='addresses';
String urlupdateadress='addresses/';
String urldeleteadress='addresses/';
GetStorage token=GetStorage();
 GetStorage dropname=GetStorage();
 GetStorage apilang=GetStorage();
var photo;
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
