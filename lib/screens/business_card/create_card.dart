import 'dart:io';
import 'dart:typed_data';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:widgets_to_image/widgets_to_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import 'package:flutter/services.dart';
import '../../Controller/create_card_controller.dart';
import '../../utils/color.dart';
import '../../utils/textstyle.dart';
import '../../wigets/text_feild.dart';
import 'dart:ui' as ui;

import '../../wigets/tost.dart';

class CreateCard extends StatefulWidget {
  const CreateCard({super.key});

  @override
  State<CreateCard> createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  CreateCardController _createCardController=Get.put(CreateCardController());

  File? pickedMedia;
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
  WidgetsToImageController controller = WidgetsToImageController();
  // to save image bytes of widget
  Uint8List? bytes;
  @override
  void initState() {
    busi_name.text=_createCardController.b_name.value.toString();
    name.text=_createCardController.name.value.toString();
    mobile.text=_createCardController.mobile.value.toString();
    whats.text=_createCardController.whatsapp.value.toString();
    email.text=_createCardController.email.value.toString();
    web.text=_createCardController.web.value.toString();
    add.text=_createCardController.add.value.toString();
    super.initState();
  }
bool isloading =false;
  Future<void> data()
  async {
    final Uint8List? bytes = await controller.capture();
    final ui.Image image = await decodeImageFromList(bytes!);


    final result = await ImageGallerySaver.saveImage(
      bytes,
      quality: 100,
      name: 'downloaded_image',
    );

    print(result);

    String data=result.toString().split(",").last;
    print(data.toString());
    if(data.toString().trim()=="isSuccess: true}")
    {
      Navigator.pop(context);
      tost("Photo Saved!");
    }
    else
    {
      Navigator.pop(context);
      tost("Please Try Again!");
    }
    isloading=false;
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //AppBar
            Container(
              height: me.height * .12,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: me.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                          )),
                      SizedBox(
                        width: me.width * .05,
                      ),
                      Text(
                        "Select Frame",
                        style: appbar_style,
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                       showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            bool video = false;

                            return StatefulBuilder(builder:
                                (BuildContext context, StateSetter setState) {
                              return isloading==false?Container(
                                height: me.height * .32,
                                width: me.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Dash",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: main_color,
                                                fontFamily: 'Manrope')),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(" Pro",
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: yellow,
                                                fontFamily: 'Manrope'))
                                      ],
                                    ),
                                    Text(
                                      "Watch Video or subscribe to save this design",
                                      style: black_semi_small,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TouchRippleEffect(
                                      rippleColor: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () {
                                        isloading=true;
                                        setState(() {

                                        });

                                        data();
                                      },
                                      child: Container(
                                        height: me.height * .09,
                                        width: me.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color:
                                                  video ? yellow : Colors.black,
                                            )),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: me.width * .2,
                                              child: Center(
                                                child: Icon(
                                                  Icons.videocam_rounded,
                                                  color: video
                                                      ? yellow
                                                      : Colors.black,
                                                  size: 45,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text("Watch a Video",
                                                    style: video
                                                        ? TextStyle(
                                                            fontFamily: 'Manrope',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 14,
                                                            color: yellow)
                                                        : black_bold),
                                                SizedBox(height: 5),
                                                Text("To save this design",
                                                    style: TextStyle(
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: Color(0xff666666)))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TouchRippleEffect(
                                      rippleColor: Colors.grey.withOpacity(.5),
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () {
                                        Navigator.pop(context);
                                        data();
                                      },
                                      child: Container(
                                        height: me.height * .09,
                                        width: me.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                              color: video == false
                                                  ? yellow
                                                  : Colors.black,
                                            )),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: me.width * .2,
                                              child: Center(
                                                child: Icon(
                                                  Icons.verified_rounded,
                                                  color: video == false
                                                      ? yellow
                                                      : Colors.black,
                                                  size: 45,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Be a Verify user",
                                                  style: video == false
                                                      ? TextStyle(
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          color: yellow)
                                                      : black_bold,
                                                ),
                                                SizedBox(height: 5),
                                                Text(
                                                    "Unlock all pro template & remove ads",
                                                    style: TextStyle(
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: Color(0xff666666)))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ):Container(
                                height: me.height * .32,
                                width: me.width,
                                color: Colors.white38,
                                child: Center(child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),),
                              );
                            });
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: main_color),
                      child: Row(
                        children: [
                          Icon(
                            Icons.download_rounded,
                            color: white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Download",
                            style: button_white_small,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: me.height * .02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                return  WidgetsToImage(
                  controller: controller,
                  child: Row(
                    children: [
                      Container(
                        height: me.height * .3,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: me.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage("assets/img_31.png")
                            )
                        ),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(_createCardController.name.value.toString(),style: card_title,),
                                Text(_createCardController.b_name.value.toString(),style: card_text,),
                                SizedBox(height: me.height * .01,),
                                Container(height: 2,width: 30,color: red,),
                                SizedBox(height: me.height * .015,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: red,
                                      child: Center(child: Icon(Icons.call,color: white,size: 15,),),
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(_createCardController.mobile.value.toString(),style: card_text,),
                                        Text(_createCardController.whatsapp.value.toString(),style: card_text,),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: me.height * .015,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: red,
                                      child: Center(child: Icon(Icons.ac_unit,color: white,size: 15,),),
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(_createCardController.web.value.toString(),style: card_text,),
                                        Text(_createCardController.email.value.toString(),style: card_text,),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(height: me.height * .015,),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 15,
                                      backgroundColor: red,
                                      child: Center(child: Icon(Icons.location_pin,color: white,size: 15,),),
                                    ),
                                    SizedBox(width: 5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            width: me.width * .4,

                                            child: Text(_createCardController.add.value.toString(),maxLines:2,style: card_text,)),

                                      ],
                                    )
                                  ],
                                ),

                              ],
                            ),
                            SizedBox(width: me.width * .2,),
                            pickedMedia!=null?Container(
                                height: me.height * .05,
                                width: me.height * .05,
                                child: Image.file(pickedMedia!, fit: BoxFit.cover)):Container()
                          ],
                        ),
                      ),
                      Container(
                        height: me.height * .3,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: me.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: AssetImage("assets/img_32.png")
                            )
                        ),
                        child: Center(
                          child:  pickedMedia!=null?Container(
                              height: me.height * .1,
                              width: me.height * .1,
                              child: Image.file(pickedMedia!, fit: BoxFit.cover)):Container(),
                        ),
                      )


                    ],
                  ),
                );
              }),
            ),


            //Data
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: me.height * .02,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16),
                  child: Text("Edit your business details",style: black_bold_large,),

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: me.height * .01,),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Business name",style: hintstyle14,),
                    ),
                    SizedBox(height: me.height * .01,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 60,
                      child: TextField(
                        controller: busi_name,
                        cursorColor: border,
                        style: black_large,
                        onChanged: (value)
                        {
                          _createCardController.b_name.value=value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your business here",
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
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Owner Name",style: hintstyle14,),
                    ),
                    SizedBox(height: me.height * .01,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 60,
                      child: TextField(
                        controller: name,
                        cursorColor: border,
                        style: black_large,
                        onChanged: (value)
                        {
                          _createCardController.name.value=value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter owner name her",
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
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Mobile number",style: hintstyle14,),
                    ),
                    SizedBox(height: me.height * .01,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 60,
                      child: TextField(
                        controller: mobile,
                        cursorColor: border,
                        style: black_large,
                        onChanged: (value)
                        {
                          _createCardController.mobile.value=value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Mobile number",
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
                        controller: whats,
                        cursorColor: border,
                        style: black_large,
                        onChanged: (value)
                        {
                          _createCardController.whatsapp.value=value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter WhatsApp number",
                          hintStyle:  hintstyle16,
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

                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Email ID",style: hintstyle14,),
                    ),
                    SizedBox(height: me.height * .01,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 60,
                      child: TextField(
                        controller: email,
                        cursorColor: border,
                        style: black_large,
                        onChanged: (value)
                        {
                          _createCardController.email.value=value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter EmailID",
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
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Website",style: hintstyle14,),
                    ),
                    SizedBox(height: me.height * .01,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      height: 60,
                      child: TextField(
                        controller: web,
                        cursorColor: border,
                        style: black_large,
                        onChanged: (value)
                        {
                          _createCardController.web.value=value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Website",
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
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 16),
                      child: Text("Address",style: hintstyle14,),
                    ),
                    SizedBox(height: me.height * .01,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),

                      child: TextField(
                        controller: add,
                        maxLines: 2,
                        cursorColor: border,
                        style: black_large,
                        onChanged: (value)
                        {
                          _createCardController.add.value=value;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter your address",
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
                    SizedBox(height: me.height * .03,),
              ],
            ),

              ],
            ),



          ],
        ),
      ),
    );
  }
}
