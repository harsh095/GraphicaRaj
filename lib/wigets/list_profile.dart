import 'package:graphica_raj/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

Widget ProfileList(BuildContext context,String icon,name,Function data)
{
  final me=MediaQuery.of(context).size;
  return  TouchRippleEffect(
    rippleColor: Colors.grey.withOpacity(.5),
    onTap: ()
    {
      data();
    },
    child: Container(
      height: me.height * .07,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(icon,height: 30,width: 30,),
              SizedBox(width: 15,),
              Text(name,style: black_semi,)
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded,size: 18,)
        ],
      ),
    ),
  );
}