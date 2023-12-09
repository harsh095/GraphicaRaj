import 'package:graphica_raj/screens/user_screens/login.dart';
import 'package:graphica_raj/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:page_transition/page_transition.dart';

import '../main_sceems/bottom_navigation.dart';


class verify_otp extends StatefulWidget {
  const verify_otp({Key? key}) : super(key: key);

  @override
  State<verify_otp> createState() => _verify_otpState();
}

class _verify_otpState extends State<verify_otp> {
  bool isdes = false;
  f1() {
    setState(() {
      isdes = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 24, top: 75, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: login_page()));
                },
                child: Container(
                  height: 24,
                  width: 24,
                  child: Image.asset("assets/img_2.png"),
                ),
              ),
              SizedBox(
                height: 44,
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      child: Image.asset("assets/img_3.png"),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Verification",
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Enter 4 digit number that sent to\nThe number on your What’s app",
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: 327,
                      height: 207,
                      color: Colors.white,
                      padding: EdgeInsets.only(top: 32, left: 21),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 49,
                            width: 286,
                            // color: Colors.black12,
                            child: OTPTextField(
                              onCompleted: f1(),
                              length: 4,
                              otpFieldStyle:
                                  OtpFieldStyle(backgroundColor: Colors.white),
                              width: MediaQuery.of(context).size.width,
                              textFieldAlignment: MainAxisAlignment.spaceAround,
                              fieldWidth: 49,
                              fieldStyle: FieldStyle.box,
                              outlineBorderRadius: 8,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 21,
                          ),
                          Container(
                            height: 52,
                            width: 286,
                            child: ElevatedButton(
                                child: Center(
                                  child: Text(
                                    'Verify',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        fontFamily: 'Manrope',
                                        letterSpacing: 1.5,
                                        color: Colors.white),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: main_color,
                                ),
                                onPressed: isdes
                                    ? () {
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                type: PageTransitionType
                                                    .topToBottom,
                                                child: BottomNavigation()));
                                      }
                                    : null),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Center(
                child: Text(
                  "Re-send code in 0:30",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Manrope',
                      letterSpacing: 1.5,
                      color: main_color),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
