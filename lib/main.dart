import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';
import 'Screens/LoginScreen/LoginDetailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/AppBody',
        routes: {

          '/AppBody': (context) => LoginDetailPage(),
        }
      );
    });
  }
}

