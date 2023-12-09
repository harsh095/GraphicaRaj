import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/textstyle.dart';

class StoryViewHome extends StatefulWidget {
  const StoryViewHome({super.key});

  @override
  State<StoryViewHome> createState() => _StoryViewHomeState();
}

class _StoryViewHomeState extends State<StoryViewHome>     with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    startLoading();
  }

  void startLoading() {
    // Simulate a 10-second loading time
    Future.delayed(Duration(seconds: 5)).then((_) {
      // Navigate to main page using Navigator.pushReplacement
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: _animationController.value,
                color:main_color,
                backgroundColor: Color(0xffF6C6CE),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.08,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Harsh Baldha",style: black_bold22,),
                    Text("Category of business will show here",style: grey_small,)
                  ],
                ),
              ),
              SizedBox(height: me.height * .02,),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: me.height * .6  ,
                width: me.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage("assets/img_7.png"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(height: me.height * .02,),

              Container(

                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight:Radius.circular(12),

                        bottomRight: Radius.circular(12)
                    ),
                    border: Border.all(
                        color: main_color.withOpacity(.07)
                    )
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact us",style: black_bold20,),
                    SizedBox(height: me.height * .02,),
                    SizedBox(
                      width: me.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 15,
                              ),
                              Container(

                                  width: me.width * .3,
                                  child: Text("  +81 7869540403",style: grey_small,))
                            ],
                          ),
                          SizedBox(height: me.height * .005,),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 15,
                              ),
                              Text("  Contact@mechodal.com",style: grey_small,)
                            ],
                          ),
                          SizedBox(height: me.height * .005,),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 15,
                              ),
                              Text("  www.mechodal.com",style: grey_small,)
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: me.height * .02,),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
