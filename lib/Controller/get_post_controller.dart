
import 'package:graphica_raj/Api/getpost_api.dart';
import 'package:graphica_raj/Model/get_post.dart';
import 'package:get/get.dart';

class GetPostController extends GetxController
{
  //GetPostModel? model;
  final model = Rxn<GetPostModel>();

  RxInt page=1.obs;
   RxBool isLoading=true.obs;


  void GetData(String p)
  {
    GetPostApi().data(p).then((value) {
     if(page.value==1)
       {
         model.value=value;
       }else
         {
           model!.value!.categories!.add(value.categories as Categories);
         }

    });


  }
}