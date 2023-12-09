import 'package:graphica_raj/screens/profile/add_business.dart';
import 'package:graphica_raj/screens/profile/edit_business.dart';
import 'package:graphica_raj/wigets/app_bar.dart';
import 'package:graphica_raj/wigets/business_list.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../../utils/color.dart';
import '../../utils/textstyle.dart';
class MyBusiness extends StatefulWidget {
  const MyBusiness({super.key});

  @override
  State<MyBusiness> createState() => _MyBusinessState();
}

class _MyBusinessState extends State<MyBusiness> {

  void Edit()
  {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.rightToLeft,
            child: EditBusiness()));
  }
  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Appbar("My business", context),
          SizedBox(height: me.height * .020,),
         BusinessList(context, "Mechodal Technology", "img",true,true,Edit)
        ],
      ),
      floatingActionButton: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: me.width * .7,
              margin: EdgeInsets.only(left: 20,bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: main_color.withOpacity(.2)
                )
              ),
              child:  TouchRippleEffect(
                rippleColor: main_color.withOpacity(.2),
                borderRadius: BorderRadius.circular(12),
                onTap: ()
                {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: AddBusiness()));
                },
                child: Center(
                  child: Text("Add new business",style: main_medium,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
