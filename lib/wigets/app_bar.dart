import 'package:graphica_raj/utils/color.dart';
import 'package:flutter/material.dart';

import '../utils/textstyle.dart';
Widget Appbar(String data,BuildContext context)
{
  final me=MediaQuery.of(context).size;
  return Container(
    height: me.height * .12,
    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
    width: me.width,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        InkWell(
            onTap: ()
            {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black ,)),
        SizedBox(width: me.width * .05,),
        Text(data,style: appbar_style,)
      ],
    ),
  );
}