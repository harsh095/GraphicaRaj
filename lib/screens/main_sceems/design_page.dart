import 'dart:convert';

import 'package:graphica_raj/Controller/get_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../wigets/wigets.dart';



class design_page extends StatefulWidget {
  const design_page({Key? key}) : super(key: key);

  @override
  State<design_page> createState() => _design_pageState();
}

class _design_pageState extends State<design_page> {

  ScrollController _scrollController = ScrollController();
  @override
  void dispose() {

    _scrollController.dispose();
    super.dispose();
  }


  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _postController.page.value=  _postController.page.value+1;
      print("Page Data"+_postController.page.value.toString());
      _postController.GetData(_postController.page.value.toString());
    }
  }
  GetPostController _postController =Get.put(GetPostController());
  void animation_video()
  {
    // Navigator.push(
    //     context,
    //     PageTransition(
    //         type: PageTransitionType.rightToLeft,
    //         child: Categary()));
  }

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 375,
              height: 107,
              color: Colors.white,
              padding: EdgeInsets.only(top: 50, left: 21, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Design's",
                    style: TextStyle(
                        color: Color(0xff1E1E1E),
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),

                  Container(
                      height: 22,
                      width: 22,
                      child: Image.asset("assets/img_5.png")),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Obx(() {
              print(_postController.page.toString());
             return  ListView.builder(
                 shrinkWrap: true,
                 primary: false,
                 padding: EdgeInsets.zero,
                 itemCount: _postController.model!.value!.categories!.length,
                 itemBuilder: (context,index){
                   return Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                     child: Column(
                       children: [
                         header_all(_postController.model!.value!.categories![index].categoryName.toString(),animation_video),
                         SizedBox(height: me.height * .01,),
                         Container(
                           height: MediaQuery.of(context).size.height * 0.18,
                           child:ListView.builder(
                             scrollDirection: Axis.horizontal,
                             itemCount:_postController.model!.value!.categories![index].data!.postList!.length,
                             itemBuilder: (BuildContext context, int i) {
                               return
                                 Column(
                                   children: [
                                     Container(
                                       margin: EdgeInsets.symmetric(horizontal: 3),
                                       width: me.width * .3,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(12),
                                           color: Colors.white60
                                       ),
                                       height: MediaQuery.of(context).size.height * 0.14,
                                       child: ClipRRect(
                                           borderRadius: BorderRadius.circular(12),
                                           child: Image.memory(base64Decode(_postController.model!.value!.categories![index].data!.postList![i].photo.toString()))),
                                     ),
                                   ],
                                 ) ;
                             },
                           ),
                         ),


                       ],
                     ),
                   );
                 });
            })
          ],
        ),
      ),
    );
  }
}

// Container(
//   height: me.height * .18,
//   width: me.width,
//   decoration: BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(12)
//   ),
//   child: Stack(
//     children: [
//       Align(
//         alignment: Alignment.centerRight,
//         child: Image.asset("assets/img_15.png",height: me.height * 16,width: me.width* .7,),
//       ),
//       Align(
//         alignment: Alignment.centerLeft,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Create your",style: black_semi,),
//               Text("Custom post",style: black_bold_large,),
//               SizedBox(height: 10,),
//               Container(
//                 height: 30,
//                 width: me.width * .3,
//                 padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: yellow
//                 ),
//                 child: Center(child: Text("Start",style: button_white,)),
//               ),
//
//             ],
//           ),
//         ),
//       )
//     ],
//   ),
// ),