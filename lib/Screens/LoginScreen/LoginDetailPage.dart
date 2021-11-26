
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../ApiCallData.dart';
import 'LoginPage.dart';
import 'SigninPage.dart';
import 'package:community_material_icon/community_material_icon.dart';
class LoginDetailPage extends StatefulWidget {
  const LoginDetailPage({Key? key}) : super(key: key);

  @override
  _LoginDetailPageState createState() => _LoginDetailPageState();
}

class _LoginDetailPageState extends State<LoginDetailPage> {
  bool showLogin = true;
  bool showSignin = false;
  bool logintap = true;
  bool Signintap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 45.h,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffb0d3d5),
                Color(0xffb5c7d5),
                Color(0xffbfaad5),


              ])
            ),
          ),
          Positioned(
            left: 3.h,
            top: 10.h,
            child:logintap==true?Text(
              'Welcome\nBack',
              style: TextStyle(color: Colors.white, fontSize: 33,letterSpacing: 2),
            ):Text(
              'Create\nAccount',
              style: TextStyle(color: Colors.white, fontSize: 33,letterSpacing: 2),
            )
          ),
          Center(
            child: Container(
              height: 50.h,
              width: 90.w,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5
                    )
                  ]
              ),
              child: buildHighlitedBox(),
            ),
          ),

          Positioned(
              left: 0,
              right: 0,
              top: 69.h,
              child: Center(
                child: Container(
                  child: GestureDetector(onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ApiCallData()),
                    );
                  },child: Icon(CommunityMaterialIcons.account_arrow_right,size: 8.h,color:  Color(0xff78add6))),
                  height: 10.h,
                  width: 20.w,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white
                  ),
                ),
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 10.h,
              child: Center(child: Text('OR',
                style:
                TextStyle(fontSize: 14.sp,
                    color:  Color(0xffb0d3d5),fontWeight:FontWeight.w800 ),))),
          buildGoogle(),

        ],
      ),
    );;
  }

  Column buildHighlitedBox() {
    return Column(
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 80),
                  child: Container(
                    height: 5.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xffF0F0F0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildLogin(),
                        buildSingupBtn(),
                      ],
                    ),
                  ),
                ),
                Container(
                  child:  logintap==true?LoginPage():SigninPage(),
                  height: 40.h,
                  width: double.infinity,
                  color: Colors.white,
                )
              ],
            );
  }



  Padding buildLogin() {
    return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:  logintap == true? Colors.white : Color(0xffF0F0F0),
                                ),

                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text('LOGIN',
                                      style: TextStyle(
                                        color:  logintap == true?  Color(0xff78add6):Color(0XFFA7BCC7),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                showLogin = true;
                                showSignin = false;
                                Signintap  = false;
                                logintap = true;
                              });
                            },
                          ),
                        );
  }




  Padding buildSingupBtn() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Signintap  == true? Colors.white : Color(0xffF0F0F0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text('SIGN UP',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Signintap  == true?  Color(0xff78add6):Color(0XFFA7BCC7),
                                    fontWeight: FontWeight.w700,

                                  ),
                                ),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                showSignin= true;
                                showLogin = false;
                                Signintap  = true;
                                logintap = false;
                              });
                            },
                          ),
                        );
  }





  Positioned buildGoogle() {
    return Positioned(
          left: 0,
          right: 0,
          bottom: 2.h,
          child: Row(
            children: [
              SizedBox(width: 17.3.h,),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    side: BorderSide(width: 1, color: Colors.grey),
                    shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    primary: Colors.white,

                    backgroundColor: Color(0xFFDE4B39)),
                child: Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(left: 3.w),
                      child: Icon(CommunityMaterialIcons.google_plus),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(right: 3.w),
                      child: Text(
                        'Google',
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
