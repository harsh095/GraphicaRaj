import 'package:graphica_raj/screens/design_frame/frame_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../wigets/app_bar.dart';

class Categary extends StatefulWidget {
  const Categary({super.key});

  @override
  State<Categary> createState() => _CategaryState();
}

class _CategaryState extends State<Categary> {
  @override
  Widget build(BuildContext context) {
    final me=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Appbar("Category name",context),
            SizedBox(height: me.height * .02,),
            GridView.builder(
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
                        1.7),
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 5, vertical: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: FramePage()));
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
            )
            
          ],
        ),
      ),
    );
  }
}
