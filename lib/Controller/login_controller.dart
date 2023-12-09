
import 'package:graphica_raj/Api/login_api.dart';
import 'package:graphica_raj/Model/login_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController
{
  RxBool isLoading=false.obs;
   final model=Rxn<LoginModel>();

   void login(String mobile)
   {
     LoginApi().Login(mobile.toString()).then((value) {
       model.value=value;


     });
   }
}