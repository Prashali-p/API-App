import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'LoginCredentials.dart';
import 'package:sizer/sizer.dart';


class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
            margin: EdgeInsets.only(top: 5.h),
            height: 10.h,
            width: 80.w,
            child: LoginCredentials(name: 'User name', icon:  Icon(CommunityMaterialIcons.account,color: Color(0xFFB6C7D1)))),
        Container(

            height: 10.h,
            width: 80.w,
            child: LoginCredentials(icon:  Icon(CommunityMaterialIcons.email,color: Color(0xFFB6C7D1)), name: 'Email',)),
        Container(

            height: 10.h,
            width: 80.w,
            child: LoginCredentials(icon:  Icon(CommunityMaterialIcons.lock,color: Color(0xFFB6C7D1)), name: 'Password',))
      ],
    );
  }
}

