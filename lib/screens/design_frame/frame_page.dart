import 'package:graphica_raj/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../../utils/textstyle.dart';
import '../../wigets/app_bar.dart';
import 'final_design.dart';
class FramePage extends StatefulWidget {
  const FramePage({super.key});

  @override
  State<FramePage> createState() => _FramePageState();
}

class _FramePageState extends State<FramePage> {
bool img=true;
  @override
  Widget build(BuildContext context) {
    List<Widget> da=[data1(context),data1(context)];
    final me=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: me.height * .12,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
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
                          onTap: ()
                          {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios_rounded,color: Colors.black ,)),
                      SizedBox(width: me.width * .05,),
                      Text("Select Frame",style: appbar_style,)
                    ],
                  ),

                  InkWell(
                    onTap: ()
                    {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                          context: context, builder: (BuildContext context)

                      {

                        bool video=false;

                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                            return Container(
                              height: me.height * .32,
                              width: me.width,
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                )
                              ),
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
                                            color: main_color,fontFamily: 'Manrope')),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(" Pro",
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w700,
                                            color: yellow,fontFamily: 'Manrope'))
                                    ],
                                  ),
                                  Text("Watch Video or subscribe to save this design",style: black_semi_small,),
                                  SizedBox(height: 10,),
                                  TouchRippleEffect(
                                    rippleColor: Colors.grey.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: ()
                                    {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.rightToLeft,
                                              child: ShareDesign()));

                                    },
                                    child: Container(
                                      height: me.height * .09,
                                      width: me.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: video?yellow:Colors.black,
                                        )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: me.width * .2,
                                            child: Center(
                                              child: Icon(Icons.videocam_rounded,color: video?yellow:Colors.black,size: 45,),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Watch a Video",style: video?TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w700, fontSize: 14,color: yellow):black_bold),
                                              SizedBox(height: 5),
                                              Text("To save this design",style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w500, fontSize: 14,color: Color(0xff666666)))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  TouchRippleEffect(
                                    rippleColor: Colors.grey.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(12),
                                    onTap: ()
                                    {
                                      Navigator.pop(context);
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              type: PageTransitionType.rightToLeft,
                                              child: ShareDesign()));
                                    },
                                    child: Container(
                                      height: me.height * .09,
                                      width: me.width,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                           color: video==false?yellow:Colors.black,
                                          )
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: me.width * .2,
                                            child: Center(
                                              child: Icon(Icons.verified_rounded,color: video==false?yellow:Colors.black,size: 45,),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Be a Verify user",style: video==false?TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w700, fontSize: 14,color: yellow):black_bold,),
                                              SizedBox(height: 5),
                                              Text("Unlock all pro template & remove ads",style: TextStyle(fontFamily: 'Manrope', fontWeight: FontWeight.w500, fontSize: 14,color: Color(0xff666666)))
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }
                        );
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: main_color
                      ),
                      child: Row(
                        children: [
                         Icon(Icons.download_rounded,color: white,size: 20,),
                          SizedBox(width: 5,),
                          Text("Download",style: button_white_small,),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: me.height * .02,),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Container(
                    height: me.height * .4,
                    width: me.width,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage("assets/img_8.png"),
                        fit: BoxFit.cover
                      )
                      
                    ),
                    child: ListView.builder(
                        itemCount: da.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){

                      return Container(

                          child: da[index]);
                    }),
                  ),
                  SizedBox(height: me.height * .02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: ()
                        {
                          img=true;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 40,
                          width: me.width * .3,
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: img?yellow:Colors.transparent
                          ),
                          child: Center(child: Text("Image",style: img?button_white:button_grey,)),
                        ),
                      ),
                      InkWell(
                        onTap: ()
                        {
                          img=false;
                          setState(() {

                          });
                        },
                        child: Container(
                          height: 40,
                          width: me.width * .3,
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: img==false?yellow:Colors.transparent
                          ),
                          child: Center(child: Text("Video",style: img==false?button_white:button_grey,)),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: me.height * .02,),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 5,
                      crossAxisCount: 3,
                      childAspectRatio:
                      MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height /
                              1.9),
                    ),

                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {

                        },
                        child:Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          width: me.width * .3,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                           border: Border.all(
                             color: Color(0xffEAECF0)
                           )
                         ),
                        ),
                      );
                    },
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget data1(BuildContext context)
  {
    final me=MediaQuery.of(context).size;
    return  Container(
      width: me.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: grey.withOpacity(.85),
                ),
                Container(
                  height: me.height * .035,
                  width: me.width * .4,
                  color: grey.withOpacity(.85),
                )

              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: me.height * .05,
                width: me.width,
                color: grey.withOpacity(.85),
              ),
              SizedBox(height: 5,),
              Container(
                height: me.height * .05,
                width: me.width,
                color: grey.withOpacity(.85),
              ),
              SizedBox(height: 5,),
            ],
          )
        ],
      ),
    );
  }

}
