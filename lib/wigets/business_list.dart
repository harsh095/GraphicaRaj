import 'dart:ffi';

import 'package:graphica_raj/utils/color.dart';
import 'package:graphica_raj/utils/textstyle.dart';
import 'package:flutter/material.dart';

Widget BusinessList(BuildContext context,String name,img,bool verify,select,Function data)
{
  final me=MediaQuery.of(context).size;
  return Container(
    height: me.height * .1,
    padding: EdgeInsets.symmetric(horizontal: 20),
    width: me.width,
    margin: EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: select?main_color:Colors.white
      )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: main_color,
                borderRadius: BorderRadius.circular(12)
              ),
            ),
            SizedBox(width: 5,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style: black_semi_large,),

                Row(
                  children: [
                    verify?Icon(Icons.verified_rounded,color: Color(0xff3F943E),):Container(),
                    Text("Verified profile",style: black1,),
                  ],
                )
              ],
            )
          ],
        ),
        select?InkWell(
           onTap: ()
            {
              data();
            },
            child: Image.asset("assets/img_30.png")):Container()
      ],
    ),
  );
}