import 'dart:async';

import 'package:animations/animations.dart';
import 'package:graphica_raj/screens/story_screens/story_view_home.dart';
import 'package:graphica_raj/screens/story_screens/story_view_page.dart';
import 'package:graphica_raj/utils/color.dart';
import 'package:graphica_raj/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:touch_ripple_effect/touch_ripple_effect.dart';

import '../business_card/business_card.dart';
import '../design_frame/frame_page.dart';



class Story {
  final String imageUrl;
  final String username;

  Story({required this.imageUrl, required this.username});
}

class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  int _currentIndex = 0;
  final List<Story> stories = [
    Story(imageUrl: 'https://via.placeholder.com/150', username: 'user1'),
    Story(imageUrl: 'https://via.placeholder.com/150', username: 'user2'),
    Story(imageUrl: 'https://via.placeholder.com/150', username: 'user3'),
    Story(imageUrl: 'https://via.placeholder.com/150', username: 'user4'),
    Story(imageUrl: 'https://via.placeholder.com/150', username: 'user5'),
  ];
  final _pageController = PageController();
  int _currentPage = 0;
  final List<Widget> _pages = [
    Container(
      color: Colors.blue,
    ),
    Container(color: Colors.white),


    Container(color: Colors.green),
    // Blank page
    Container(color: Colors.red),

    Container(color: Colors.blue),
    // Blank page
    Container(color: Colors.green),
    // Blank page
    Container(color: Colors.red),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final pages = List.generate(
      6,
      (index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade300,
            ),
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Container(
              height: 280,
              child: Center(
                  child: Text(
                "Page $index",
                style: TextStyle(color: Colors.indigo),
              )),
            ),
          ));
  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  width: 375,
                  height: 107,
                  color: white,
                  padding: EdgeInsets.only(top: 50, left: 21, right: 23),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: BusinessCard()));
                        },
                        child: Container(
                            height: 22,
                            width: 22,
                            child: Image.asset("assets/img_4.png")),
                      ),
                      SizedBox(
                        width: 72,
                      ),
                      Text(
                        "Design.",
                        style: TextStyle(
                            color: main_color,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "Dash",
                        style: TextStyle(
                            color: yellow,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        width: 58,
                      ),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                            height: 22,
                            width: 22,
                            child: Image.asset("assets/img_5.png")),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(left: 18),
                  child: Column(
                    children: [
                      Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: stories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                 ClipRRect(
                                   borderRadius: BorderRadius.circular(100),

                                   child: OpenContainer(

                                       openElevation: 0,
                                       clipBehavior: Clip.none,
                                       openShape: CircleBorder(
                                         side: BorderSide.none
                                       ),
                                       closedShape: CircleBorder(),
                                       closedBuilder: (context,OpenContainer)
                                       {
                                         return  CircleAvatar(
                                           backgroundImage:
                                           NetworkImage(stories[index].imageUrl),
                                           radius: 30,
                                         );
                                       }, openBuilder:(context,OpenContainer)
                                   {
                                     return story_view_page();
                                   }),
                                 ),
                                  SizedBox(height: 4),
                                  Text(
                                    stories[index].username,
                                    style:black_semi_small,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Stack(children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: PageView(
                                  controller: _pageController,
                                  onPageChanged: (int page) {
                                    setState(() {
                                      _currentPage = page;
                                    });
                                  },
                                  children: _pages,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SmoothPageIndicator(
                                  controller:
                                      _pageController, // Required to indicate the current page
                                  count: _pages.length, // The number of pages
                                  effect: ExpandingDotsEffect(
                                    dotColor: Colors.grey,
                                    activeDotColor: Colors.black,
                                    dotHeight: 2,
                                    dotWidth: 2,
                                    spacing: 4,
                                    expansionFactor: 4,
                                  ),
                                ),
                              ),
                            ),
                          ])),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Upcoming Days & Festival",
                          style: black_bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.18,

                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (BuildContext context, int index) {
                              return TouchRippleEffect(
                                rippleColor: Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: FramePage()));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                    width: me.width * .4,height: me.height * .18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(
                                        image: AssetImage("assets/img_7.png"),

                                      )
                                    ),
                                    child: ClipRRect(

                                        borderRadius: BorderRadius.circular(12),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(vertical: 10),
                                                padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
                                                decoration: BoxDecoration(color: Colors.black,
                                                borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Text("14 March",style: button_white,),
                                              ),
                                            )
                                          ],
                                        ))),
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Container(

                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        width: me.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                            color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Let",style: black_semi_small,),
                            SizedBox(height: 5,),
                            Text("AI our work for you",style: black_bold_large,),
                            SizedBox(height: 5,),
                            SizedBox(
                                width: me.width * .65,
                                child: Text("Share your interest with us dash will suggest you post design which is releted to your interest",style: black_semi_extra_small,)),
                            SizedBox(height: 10,),
                            Container(
                              height: 30,
                              width: me.width * .2,
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: yellow
                              ),
                              child: Center(child: Text("Start",style: button_white,)),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Best of todays",
                          style: black_bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,

                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int index) {
                              return OpenContainer(closedBuilder: (context, openContainer)
                                  {

                                    return Container(
                                      height: MediaQuery.of(context).size.height * 0.3,
                                      width: MediaQuery.of(context).size.height * 0.2,
                                      margin: EdgeInsets.symmetric(horizontal: 3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                          image: AssetImage("assets/img_7.png"),
                                          fit: BoxFit.cover
                                        )
                                      ),

                                    );
                                  },
                                  openBuilder: (context, openContainer)
                                {

                                 return StoryViewHome();

                               }

                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .04,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   //unselectedLabelStyle: TextStyle(color: Color(0xff800080)),
      //   selectedLabelStyle: TextStyle(color: Color(0xff800080)),
      //
      //   onTap: onTabTapped,
      //   currentIndex: _currentIndex,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         "assets/img_9.png",
      //         height: MediaQuery.of(context).size.height * 0.04,
      //         width: MediaQuery.of(context).size.width * 0.08,
      //       ),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         "assets/img_10.png",
      //         height: MediaQuery.of(context).size.height * 0.04,
      //         width: MediaQuery.of(context).size.width * 0.08,
      //       ),
      //       label: 'Design',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Image.asset(
      //         "assets/img_11.png",
      //         height: MediaQuery.of(context).size.height * 0.04,
      //         width: MediaQuery.of(context).size.width * 0.08,
      //       ),
      //       label: 'More',
      //     ),
      //   ],
      // ),
    );
  }
}

