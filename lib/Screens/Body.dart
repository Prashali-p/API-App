import 'package:community_material_icon/community_material_icon.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:packing_api_app/Modals/Search/SearchProduct.dart';
import 'package:packing_api_app/Screens/ProductDetail.dart';
import '../Constants/Constant.dart';
import '../Modals/Product.dart';
import 'package:sizer/sizer.dart';

class ProductDetailScreen extends StatefulWidget {

  final List<Photo> photos;

  const ProductDetailScreen({Key? key, required this.photos}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
            children: [

              buildSearch(context),

              buildProductList()
            ],
      ),
    );
  }







  Column buildSearch(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: Colors.white,
          width: 350,

          child: TextField(

              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                  hintText: 'Search Product',
                  hintStyle: TextStyle(color: Colors.black54),
                  prefixIcon: GestureDetector(onTap: (){
                    showSearch(context: context, delegate: SearchProduct(widget.photos));
                  },
                    child: Icon(
                      Icons.search,color: Colors.black54,),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54),
                      borderRadius: BorderRadius.all(Radius.circular(7),
                      )))),),
        Padding(
          padding:  EdgeInsets.only(top: 2.h),
          child: Text('NEW ARRIVALS',style: TextStyle(color: Color(0xff78add6),fontWeight: FontWeight.bold,fontSize:20,)),
        )
      ],
    );
  }

  Expanded buildProductList() {
    return Expanded(

                child:  Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  child: new StaggeredGridView.countBuilder(
                     crossAxisCount: 2,
                     itemCount: widget.photos.length,

                       itemBuilder: (BuildContext context, int index)
                       => Column(
                        children: [
                           Expanded(
                             child: GestureDetector(onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(item: widget.photos[index].id,
                                 pic: widget.photos[index].image,
                                 descript: widget.photos[index].description, categ: widget.photos[index].category,)));
                             },
                               child: Stack(
                                 children: [
                          Card(
                                      child: Hero(tag: widget.photos[index].id,
                                      child: Image.network(widget.photos[index].image)),

                            elevation: 2.5,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),

                          ),
                                   Positioned(
                                     top: 0.5.h,
                                     left: 1.h,
                                     child: CircleAvatar(

                                       backgroundColor: Colors.grey,
                                       child: FavoriteButton(
                                         iconColor: Colors.white,
                                         iconDisabledColor: Colors.red,
                                         iconSize: 30,
                                         isFavorite: true,
                                         // iconDisabledColor: Colors.white,
                                         valueChanged: (_isFavorite) {
                                           print('Is Favorite : $_isFavorite');
                                         },
                                       ),
                                     ),
                                   ),
                        ],
                               ),
                             ),
                      ),
                      SizedBox(height: 0.5.h,),
                      Align(alignment:Alignment.centerLeft,child: Text(widget.photos[index].title,style: TextConstant.kDefaultText,)),
                          Align(alignment: Alignment.centerLeft,
                            child: Text("Rs"+
                   " ${widget.photos[index].price}",style: TextConstant.kDefaultPrice,),
                          ),


                    ],
                  ),


              staggeredTileBuilder: (int index) =>

              new StaggeredTile.count(1, index.isEven ? 1.5: 1.5),

              mainAxisSpacing: 20.0,
              crossAxisSpacing: 10.0,
            ),
                ));
  }
}
