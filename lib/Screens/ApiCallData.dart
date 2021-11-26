import 'dart:convert';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:packing_api_app/Screens/Body.dart';
import 'package:packing_api_app/Constants/Constant.dart';
import 'package:packing_api_app/Screens/LoginScreen/LoginDetailPage.dart';
import '../Modals/Product.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;



class ApiCallData extends StatefulWidget {
  const ApiCallData({Key? key}) : super(key: key);

  @override
  _ApiCallDataState createState() => _ApiCallDataState();
}



Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client.get(Uri.parse('https://fakestoreapi.com/products'));

  return compute(parsePhotos, response.body);

}


List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}



class _ApiCallDataState extends State<ApiCallData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      bottomNavigationBar: CurvedNavigationBar(

        backgroundColor: Colors.white,
        color: Color(0xff78add6),
        items: [
          Icon(Icons.add, size: 30),
          Icon(CommunityMaterialIcons.home,size: 30,),
          Icon(Icons.dashboard_outlined,size: 30,),
          Icon(CommunityMaterialIcons.heart,size: 30,),
          Icon(CommunityMaterialIcons.account_circle_outline,size: 30,),

        ],
      ),

      body:FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return ProductDetailScreen(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }





  AppBar buildAppBar() {
    return AppBar(
      toolbarHeight: 8.h,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[

        IconButton(onPressed: (){},

            icon: Icon(CommunityMaterialIcons.cart,
              color: Color(0xff78add6),)),
      ],

      leading: IconButton(icon:

      IconButton(onPressed: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginDetailPage()),
        );
      },

          icon: Icon(CommunityMaterialIcons.arrow_left,
            color: Color(0xff78add6),)),
        color: Color(0xff78add6),
        onPressed: () {  },),


    );
  }
}
