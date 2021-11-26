import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:packing_api_app/Constants/Constant.dart';
import 'package:packing_api_app/Modals/Product.dart';
import 'package:sizer/sizer.dart';

class ShortlistSearchProduct extends StatelessWidget {
  const ShortlistSearchProduct({Key? key,required this.photos}) : super(key: key);
  final List<Photo> photos;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: new StaggeredGridView.countBuilder(

        crossAxisCount: 2,
        itemCount: photos.length,

        itemBuilder: (BuildContext context, int index)
        => Column(
          children: [
            Expanded(
              child: Card(
                child: Image.network(photos[index].image),

                elevation: 2.5,
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

              ),
            ),
            SizedBox(height: 0.5.h,),
            Align(alignment:Alignment.centerLeft,child: Text(photos[index].title,style: TextConstant.kDefaultText,)),
            Align(alignment: Alignment.centerLeft,
              child: Text("Rs"+
                  " ${photos[index].price}",style: TextConstant.kDefaultPrice,),
            ),


          ],
        ),


        staggeredTileBuilder: (int index) =>

        new StaggeredTile.count(1, index.isEven ? 1.6: 1.3),

        mainAxisSpacing: 20.0,
        crossAxisSpacing: 10.0,
      ),
    );
  }
}
