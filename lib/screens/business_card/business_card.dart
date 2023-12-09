import 'package:graphica_raj/screens/business_card/create_card.dart';
import 'package:graphica_raj/wigets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../design_frame/final_design.dart';

class BusinessCard extends StatefulWidget {
  const BusinessCard({super.key});

  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Appbar("Business card", context),
          SizedBox(
            height: me.height * .005,
          ),
          TabBar(
            controller: _tabController,
            labelColor: Color(0xff2D006C), // Set the text color of the selected tab
            unselectedLabelColor: Color(0xffD7DAE3), // Set the text color of unselected tabs
            labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w800,fontFamily: 'Manrope'),
             indicatorColor: Color(0xff2D006C),// Customize the text style
            tabs: [
              Tab(text: 'Square',),
              Tab(text: 'Vertical',),
              Tab(text: 'Horizontal',),
            ],
          ),
          Expanded(child:  TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child:  GridView.builder(
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
                              2.0),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: CreateCard()));
                        },
                        child:Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          width: me.width * .3,
                          height: MediaQuery.of(context).size.height * 0.14,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(image: AssetImage('assets/img_8.png',),fit: BoxFit.fill,)),
                        ),
                      );
                    },
                  ),
                ),
                SingleChildScrollView(
                  child:  GridView.builder(
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
                              1.4),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: CreateCard()));
                        },
                        child:Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          width: me.width * .3,
                          height: MediaQuery.of(context).size.height * 0.14,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(image: AssetImage('assets/img_8.png',),fit: BoxFit.fill,)),
                        ),
                      );
                    },
                  ),
                ),
                SingleChildScrollView(
                  child:  GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      childAspectRatio:
                      MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height /
                              3.8),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 10),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  child: CreateCard()));
                        },
                        child:Container(
                          margin: EdgeInsets.symmetric(horizontal: 3),
                          width: me.width * .3,
                          height: MediaQuery.of(context).size.height * 0.14,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(image: AssetImage('assets/img_8.png',),fit: BoxFit.fill,)),
                        ),
                      );
                    },
                  ),
                ),
              ]))

        ],
      ),
    );
  }
}
