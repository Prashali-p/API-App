import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginCredentials extends StatelessWidget {
  final String name;
  final Widget icon;
  const LoginCredentials({
    Key? key, required this.name, required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(

          prefixIcon: icon,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFB6C7D1)),
              borderRadius: BorderRadius.all(Radius.circular(25),
              )),
          contentPadding: EdgeInsets.all(10),
          hintText: name,
          hintStyle: TextStyle(fontSize: 14.sp,color: Color(0XFFA7BCC7) )


      ),
    );
  }
}
