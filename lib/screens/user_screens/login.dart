import 'package:graphica_raj/Controller/user_controller.dart';
import 'package:graphica_raj/Model/login_model.dart';
import 'package:graphica_raj/utils/color.dart';
import 'package:graphica_raj/wigets/tost.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Api/login_api.dart';
import '../main_sceems/bottom_navigation.dart';

class login_page extends StatefulWidget {
  const login_page({Key? key}) : super(key: key);

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  LoginModel? model;
  TextEditingController _mobile=TextEditingController();
  UserController _userController=Get.put(UserController());
  bool lod=false;
  void Login()
  {
    lod=true;
    setState(() {

    });
    LoginApi().Login(_mobile.text.toString()).then((value) async {
      model=value;
      if(model!.status=="success")
        {
          SharedPreferences shar = await SharedPreferences.getInstance();
          shar.setString("id", model!.data!.id.toString());
          shar.setString("name", model!.data!.id.toString());
          shar.setString("mobile", model!.data!.id.toString());
          shar.setString("email", model!.data!.id.toString());
          shar.setBool("islogin", true);
          _userController.setData();
          tost(model!.message.toString());
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType
                      .topToBottom,
                  child: BottomNavigation()));


        }
      else
        {
          tost(model!.message.toString());
        }

      lod=false;
      setState(() {

      });
    });
  }
  int i=0;
  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          i++;
        });debugPrint("object");
        if (i == 2) {
          SystemNavigator.pop();
          return true;
        }


        return false;
      },
      child: Scaffold(
        body: Container(
          height: me.height,
          width: me.width,
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: me.height* .1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       "Design.",
                       style: TextStyle(
                           color: main_color,
                           fontSize: 44,

                           fontWeight: FontWeight.w800),
                     ),
                     Text(
                       "Dash",
                       style: TextStyle(
                           color: yellow,
                           fontSize: 44,
                           fontWeight: FontWeight.w800),
                     ),
                   ],
                 ),
                 SizedBox(height: 10,),
                 Container(height: 1,width: me.width * .6,color: yellow,),
                 SizedBox(height: 10,),
                 Text(
                   "Apka apna Design partner",
                   style: TextStyle(
                       color: main_color,
                       fontSize: 14,
                       fontFamily: 'Manrope',

                       fontWeight: FontWeight.w600),
                 ),
               ],
             ),
              Container(
                padding: EdgeInsets.only(left: 26),
                child: Column(
                  children: [
                    Text(
                      'Welcome to Design.Dash',
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Say hello to your new desining",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Manrope',
                          color: font_color),
                    ),
                    Text(
                      "partner app",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Manrope',
                          color:font_color),
                    )
                  ],
                ),
              ),
              Container(


                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)
                ),
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "What’s app number",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Manrope',
                          color: font_color),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _mobile,
                      decoration:  InputDecoration(
                          hintText: 'eg. +91 9493929292l',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Manrope',
                              color:font_color
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey))),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    SizedBox(

                        height: 52,
                        child: ElevatedButton(
                            child: Center(
                              child: lod?CircularProgressIndicator(
                                color: Colors.white,
                              ):Text(
                                'Verify Number',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: 'Manrope',
                                    color: white),
                              )
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: main_color,
                            ),
                            onPressed: () {
                              if(_mobile.text.length!=10)
                                {
                                  tost("Please Enter Valid Number");
                                }
                              else
                                {
                                  Login();
                                }
                            })),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
