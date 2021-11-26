import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:packing_api_app/Constants/Constant.dart';
import 'package:packing_api_app/Screens/ApiCallData.dart';

import 'package:sizer/sizer.dart';


class ProductDetail extends StatelessWidget {

  final item;
  final pic;
  final descript;
  final categ;
  const ProductDetail({Key? key,required this.item,required this.pic, required this.descript,required this.categ}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
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
            MaterialPageRoute(builder: (context) => ApiCallData()),
          );
        },

            icon: Icon(CommunityMaterialIcons.arrow_left,
              color: Color(0xff78add6),)),
          color: Color(0xff78add6),
          onPressed: () {  },),


      ),
      body: Column(
        children: [

          Center(
            child: Container(

              height: 50.h,
              child: Hero(tag: item,
                  child: Image.network(pic,fit: BoxFit.fill,)),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 4.h),
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(50) ,topRight: Radius.circular(50)),
                    color: Color(0xff93bad7)
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      padding: EdgeInsets.only(top: 4.h,left: 2.h),
                      child: Text(categ,style: TextConstant.kDefaultDetailHeading,),
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 2.7.h,top: 1.h),
                      child: Text(descript,style: TextConstant.kDefaultText,),
                    ),

                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 2.h,left: 4.w),
                          height: 10.h,
                          width: 20.w,

                          decoration: BoxDecoration( border: Border.all(color: Color(0xff3780b9)),

                              borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  SizedBox(width: 2,),
                                  Text('color',style: TextStyle(fontSize: 14,decoration: TextDecoration.none,color:Color(0xff3780b9))),
                                ],
                              ),

                              Center(child:
                              Container(
                                margin: EdgeInsets.only(top: 1.h),
                                height: 10,
                                width: 50,
                                color: Color(0xff0d2674),),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 1.h),
                                height: 10,
                                width: 50,

                                color: Colors.orange,),


                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                )),
          )
        ],

      ),
    );
  }
}
