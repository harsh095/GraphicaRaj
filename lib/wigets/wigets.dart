import 'package:graphica_raj/utils/textstyle.dart';
import 'package:flutter/material.dart';

Widget header_all(String data,Function abc)
{
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
       Text(data,style: black_semi,),
       InkWell(
           onTap: ()
           {
             abc();
           },
           child: Text("View All",style: black_semi_small,))
     ],
    ),
  );
}