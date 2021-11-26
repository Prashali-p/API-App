import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:packing_api_app/Screens/ApiCallData.dart';
import 'package:packing_api_app/Screens/Body.dart';
import '../Product.dart';
import 'package:sizer/sizer.dart';

class SearchProduct extends SearchDelegate{
  
  final List<Photo> photo;

  SearchProduct(this.photo);
  @override
  List<Widget> buildActions(BuildContext context) {
   return [
     Icon(Icons.close)
   ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ApiCallData()),
      );
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
   return ListView.builder(
     itemCount: photo.length,
       itemBuilder: (BuildContext context , int index){
     return Container(
       height: 30.h,
       width: 40.w,
       child: Image.network(photo[index].image),
     );
   });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = photo.where((Photo){
      return Photo.category.toLowerCase().contains(query.toLowerCase());
    });
    return ListView.builder(
        itemCount: suggestion.length,itemBuilder: (BuildContext context, int index){
      return ListTile(title: Text(photo[index].category),
      onTap: (){
        query = photo[index].category;
      },);

    });
  }
  
}