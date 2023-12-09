import 'package:flutter/material.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

Widget ShareButton(BuildContext context,String img,Color abc,Function data)
{
  return TouchRippleEffect(
    rippleColor: Colors.grey.withOpacity(.5),
    borderRadius: BorderRadius.circular(12),
    onTap: ()
    {
      data();
    },
    child: Container(
      height: 40,
      width: 40,
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: abc,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Center(child: Image.asset(img,height: 20,)),
    ),
  );
}