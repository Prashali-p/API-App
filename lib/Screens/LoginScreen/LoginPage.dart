import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import 'LoginCredentials.dart';
import 'package:sizer/sizer.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 7.h),
            height: 10.h,
            width: 80.w,
            child: LoginCredentials(icon:  Icon(CommunityMaterialIcons.email,color: Color(0xFFB6C7D1)), name: 'Email',)),
        Container(
            margin: EdgeInsets.only(bottom: 3.h),
            height: 10.h,
            width: 80.w,
            child: LoginCredentials(icon:  Icon(CommunityMaterialIcons.lock,color: Color(0xFFB6C7D1)), name: 'Password',)),
        Text('Forgot Password ?',style: TextStyle(color: Color(0xFFB6C7D1),fontWeight: FontWeight.bold),)
      ],
    );
  }
}
