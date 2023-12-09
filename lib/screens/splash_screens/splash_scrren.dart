import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:graphica_raj/screens/user_screens/login.dart';
import 'package:graphica_raj/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/get_post_controller.dart';
import '../main_sceems/bottom_navigation.dart';

class CircularAnimation extends StatefulWidget {
  @override
  _CircularAnimationState createState() => _CircularAnimationState();
}

class _CircularAnimationState extends State<CircularAnimation>
    with TickerProviderStateMixin {
  GetPostController _postController=Get.put(GetPostController());
  void initState() {
    super.initState();

    Timer(Duration(seconds: 7), () =>CheckIn());
  }
  Future<void> CheckIn()
  async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print("kjridghijghsd"+prefs.getString('isActive').toString());
    if(prefs.getBool('islogin')==true)
    {
      _postController.GetData(_postController.page.value.toString());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => BottomNavigation())));

    }
    else
    {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: ((context) => login_page())));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 311,
            ),
            Container(
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 104,
                        ),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: main_color),
                        ),
                        SizedBox(
                          width: 175,
                        ),
                        Container(
                          height: 9,
                          width: 9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: main_color),
                        ),
                      ],
                    ),
                    Container(
                      color: yellow,
                      child: TextLiquidFill(
                        text: 'Design.',
                        waveColor: main_color,
                        boxBackgroundColor: white,
                        waveDuration: Duration(seconds: 1),
                        textStyle: TextStyle(
                          fontSize: 44.0,
                          fontWeight: FontWeight.bold,
                        ),
                        boxHeight: 71.0,
                      ),
                    ),
                    Container(
                      color: main_color,
                      child: TextLiquidFill(
                        text: 'Dash',
                          waveColor: yellow,
                        waveDuration: Duration(seconds: 1),
                        boxBackgroundColor: white,
                        textStyle: TextStyle(
                            fontSize: 44.0,
                            fontWeight: FontWeight.bold,
                          color: yellow,),
                        boxHeight: 70.0,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            color: main_color,),
                        ),
                        SizedBox(
                          width: 63,
                        ),
                        Column(
                          children: [
                            Text("Apka apna",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  color: main_color,)),
                            SizedBox(
                              height: 4,
                            ),
                            Text("Design Partner",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  color: main_color,))
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            color: main_color,),
                        ),
                      ],
                    ),
                  ])),
            ),
            SizedBox(
              height: 264,
            ),
            Row(
              children: [
                SizedBox(
                  width: 74,
                ),

                SizedBox(
                    height: 22,
                    width: 227,
                    child: Image.asset('assets/img.png'))
              ],
            )
          ],
        ));
  }
}
