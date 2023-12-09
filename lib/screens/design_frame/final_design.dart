import 'package:graphica_raj/utils/color.dart';
import 'package:graphica_raj/utils/textstyle.dart';
import 'package:graphica_raj/wigets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:social_share/social_share.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';
import '../../wigets/share_button.dart';
import 'frame_page.dart';
class ShareDesign extends StatefulWidget {
  const ShareDesign({super.key});

  @override
  State<ShareDesign> createState() => _ShareDesignState();
}

class _ShareDesignState extends State<ShareDesign> {

  void whatsapp()
  {
    SocialShare.shareInstagramStory(appId: "appId", imagePath: "imagePath");
  }

  void insta()
  {}
  void Facebook()
  {

  }

  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Appbar("Share Your design", context),
              Container(
                height: me.height * .35,
                width: me.width,
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage("assets/img_7.png"),
                    fit: BoxFit.cover
                  ),),),

              SizedBox(height: me.height * .01,),
              Container(
                height: me.height * .12,
                width: me.width,
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top:  BorderSide(color: main_color.withOpacity(.08)),
                    bottom: BorderSide(color: main_color.withOpacity(.08))
                  )
                ),
                child: Column(
                  children: [
                    Text("Share design on",style: black_bold,),
                    SizedBox(height: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ShareButton(context,"assets/img_16.png",Color(0xffE0FFF0),whatsapp),
                        ShareButton(context,"assets/img_17.png",Color(0xffFFDFDF),whatsapp),
                        ShareButton(context,"assets/img_18.png",Color(0xffDDD9FF),whatsapp),
                        ShareButton(context,"assets/img_19.png",Color(0xffE0FFF0),whatsapp),
                        ShareButton(context,"assets/img_20.png",Color(0xffFFDFDF),whatsapp),
                        ShareButton(context,"assets/img_21.png",Color(0xffDDD9FF),whatsapp),
                      ],
                    )


                  ],
                ),
              )


            ],
          ),
          Container(
            height: me.height * .15,
            width:  me.width,
            padding: EdgeInsets.symmetric(horizontal: 20,),
            decoration: BoxDecoration(
              color: main_color.withOpacity(.10),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12),

              )
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: me.width * .5,
                        child: Text("We value your feedback, let us make Your experience Better",style: black_bold_small,)),
                    SizedBox(
                      height: 10,
                    ),
                    TouchRippleEffect(
                      rippleColor: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      onTap: ()
                      {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: FramePage()));
                      },
                      child: Container(
                        height: 30,
                        width: me.width * .45,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Center(
                          child: Text("Share your feedback",style: button_white_small,),
                        ),
                      ),
                    )
                  ],
                ),

             Row(
               children: [
                 ShareButton(context,"assets/img_16.png",Colors.white,whatsapp),
                 ShareButton(context,"assets/img_17.png",Colors.white,whatsapp),
                 ShareButton(context,"assets/img_18.png",Colors.white,whatsapp),
               ],
             )
              ],
            ),
          )
        ],
      ),
    );
  }

  
}
