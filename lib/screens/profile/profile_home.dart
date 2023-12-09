import 'package:graphica_raj/screens/profile/my_business.dart';
import 'package:graphica_raj/wigets/list_profile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../../utils/color.dart';
import '../../utils/textstyle.dart';
import '../user_screens/login.dart';

class ProfileHome extends StatefulWidget {
  const ProfileHome({super.key});

  @override
  State<ProfileHome> createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {

  void mybusiness()
  {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: MyBusiness()));
  }
  void refer()
  {

  }
  void feedback()
  {

  }

  void help()
  {

  }

  void sharapp()
  {

  }

  void faq()
  {

  }
  void terms()
  {

  }
  void privacy()
  {

  }
  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffFFFDF6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              width: me.width,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: me.width * .1,),
                  Text("Profile",style: appbar_style,),
                  SizedBox(height: me.width * .02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage:
                        NetworkImage(""),

                        radius: 45,
                      ),
                      SizedBox(width: me.width * .02,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Harsh Baldha",style: black_bold_large,),
                              Icon(Icons.verified_rounded,color: Color(0xff3F943E),)
                            ],
                          ),
                          Text("milan@mechodal.com",style: grey_small,)
                        ],
                      )
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: me.width * .04,),
            ProfileList(context, "assets/img_22.png", "My business",mybusiness),
            ProfileList(context, "assets/img_23.png", "Refer & Earn",mybusiness),
            ProfileList(context, "assets/img_24.png", "Give Feedback",mybusiness),
            ProfileList(context, "assets/img_25.png", "Help & Support",mybusiness),
            ProfileList(context, "assets/img_26.png", "Share App",mybusiness),
            ProfileList(context, "assets/img_27.png", "FAQ’se",mybusiness),
            ProfileList(context, "assets/img_28.png", "Terms of Use",mybusiness),
            ProfileList(context, "assets/img_29.png", "Privacy Policys",mybusiness),
            SizedBox(height: me.width * .5,),
          ],
        ),
      ),
      floatingActionButton: TouchRippleEffect(
        rippleColor: Colors.grey,
        onTap: ()
        async {
          SharedPreferences shar = await SharedPreferences.getInstance();
          shar.clear();
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType
                      .topToBottom,
                  child: login_page()));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TouchRippleEffect(
              rippleColor: Colors.grey,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 50,
                width: me.width * .7,
                margin: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: main_color,
                  borderRadius: BorderRadius.circular(12),
                ),
               child: Center(
                 child: Text("Logout",style: button_white_small,),
               ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
