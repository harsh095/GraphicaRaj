

import 'dart:io';

import 'package:graphica_raj/utils/textstyle.dart';
import 'package:graphica_raj/wigets/app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../../utils/color.dart';
import '../../wigets/text_feild.dart';

class AddBusiness extends StatefulWidget {
  const AddBusiness({super.key});

  @override
  State<AddBusiness> createState() => _AddBusinessState();
}

class _AddBusinessState extends State<AddBusiness> {
  File? pickedMedia;
  String? cata;
  List<String> cat_list=['Data 1','Data 2','Data 3'];

  TextEditingController busi_name=TextEditingController();
  TextEditingController name=TextEditingController();
  TextEditingController mobile=TextEditingController();
  TextEditingController whats=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController web=TextEditingController();
  TextEditingController add=TextEditingController();
  TextEditingController stat=TextEditingController();
  Future<void> pick() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        pickedMedia = File(pickedFile.path);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Appbar("My business", context),
            SizedBox(height: me.height * .02,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 16),
              child: Text("Select business category",style: hintstyle14,),
            ),
            SizedBox(height: me.height * .01,),
            Container(

              height: 60,
              margin: EdgeInsets.symmetric(horizontal: 16),
              width: me.width,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: border,

                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: Text(
                    'select category',
                    style: hintstyle16,
                  ),
                  items: cat_list
                      .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: black_large,
                    ),
                  ))
                      .toList(),
                  value: cata,
                  onChanged: (String? value) {
                    setState(() {
                      cata = value;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    width: 140,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
            SizedBox(height: me.height * .02,),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 16),
              child: Text("Business Logo",style: hintstyle14,),
            ),
            SizedBox(height: me.height * .01,),
            Container(
              height: 50,
              width: 50,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black26
              ),
              child: TouchRippleEffect(
                rippleColor: grey.withOpacity(.5),
                borderRadius: BorderRadius.circular(12),
                onTap: ()
                {
                  pick();
                },
                child: pickedMedia==null?Center(
                  child: Icon(Icons.image_outlined,color: Colors.white,size: 30,),
                ): Image.file(pickedMedia!, fit: BoxFit.cover),
              ),
            ),
            TextFeild(busi_name, context, "Business name","Enter your business here"),
            TextFeild(busi_name, context, "Owner Name","Enter owner name here"),
            TextFeild_mob(mobile, whats, context, "Mobile number", "WhatsApp number"),
            TextFeild(email, context, "Email ID","Enter email ID"),
            TextFeild(web, context, "Website","Enter website"),
            TextFeild1(add, context, "Address", "Enter your address", 2),
            TextFeild(stat, context, "State","Enter your state"),
            SizedBox(height: me.height * .02,),
            Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: me.width * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: yellow
                    )
                  ),
                  child:  TouchRippleEffect(
                    rippleColor: yellow.withOpacity(.2),
                    borderRadius: BorderRadius.circular(12),
                    child: Center(
                      child: Text("Clear data",style: yellow16,),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: me.width * .5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                     color: main_color
                  ),
                  child:  TouchRippleEffect(
                    rippleColor: main_color.withOpacity(.2),
                    borderRadius: BorderRadius.circular(12),
                    child: Center(
                      child: Text("Clear data",style: button_white_small,),
                    ),
                  ),
                )
              ],
            ),
            ),
            SizedBox(height: me.height * .05,),


          ],
        ),
      ),
    );
  }
}
