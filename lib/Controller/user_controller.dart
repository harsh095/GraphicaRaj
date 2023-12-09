import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController
{
  RxString id="".obs;
  RxString name="".obs;
  RxString  mobile="".obs;
  RxString email="".obs;

  Future<void> setData()
  async {
    SharedPreferences shar = await SharedPreferences.getInstance();
    id.value=shar.getString("id").toString();
    name.value=shar.getString("name").toString();
    mobile.value=shar.getString("mobile").toString();
    email.value=shar.getString("email").toString();
  }
}