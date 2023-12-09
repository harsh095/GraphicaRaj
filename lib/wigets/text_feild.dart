import 'package:flutter/material.dart';

import '../utils/color.dart';
import '../utils/textstyle.dart';


Widget TextFeild(TextEditingController controller,BuildContext context,String hint,hint2)
{
  final me=MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: me.height * .01,),
      Padding(
        padding:EdgeInsets.symmetric(horizontal: 16),
        child: Text(hint,style: hintstyle14,),
      ),
      SizedBox(height: me.height * .02,),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        child: TextField(
          controller: controller,
          cursorColor: border,
          style: black_large,
          decoration: InputDecoration(
            hintText: hint2,
            hintStyle:
            hintstyle16,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 20),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),

          ),
        ),
      ),
    ],
  );
}
Widget TextFeild1(TextEditingController controller,BuildContext context,String hint,hint2,int line)
{
  final me=MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: me.height * .01,),
      Padding(
        padding:EdgeInsets.symmetric(horizontal: 16),
        child: Text(hint,style: hintstyle14,),
      ),
      SizedBox(height: me.height * .02,),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          controller: controller,
          cursorColor: border,
          style: black_large,
          maxLines: line,
          decoration: InputDecoration(
            hintText: hint2,
            hintStyle:
            hintstyle16,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 20),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),

          ),
        ),
      ),
    ],
  );
}
Widget TextFeild_mob(TextEditingController controller,controller1,BuildContext context,String hint,hint2)
{
  final me=MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: me.height * .01,),
      Padding(
        padding:EdgeInsets.symmetric(horizontal: 16),
        child: Text(hint,style: hintstyle14,),
      ),
      SizedBox(height: me.height * .01,),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        child: TextField(
          controller: controller,
          cursorColor: border,
          style: black_large,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Enter "+hint,
            hintStyle:
            hintstyle16,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 20),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),

          ),
        ),
      ),
      SizedBox(height: me.height * .01,),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        child: TextField(
          controller: controller1,
          cursorColor: border,
          style: black_large,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: "Enter "+hint2,
            hintStyle:
            hintstyle16,
            contentPadding: EdgeInsets.symmetric(
                horizontal: 20, vertical: 20),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color:
                  border
              ),
            ),

          ),
        ),
      ),
    ],
  );
}