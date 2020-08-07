import 'package:flutter/material.dart';
import '../widgets/catagory_item.dart';
import '../category_list.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    return GridView(
        padding: EdgeInsets.all(15),
      children: DUMMYCATEGORY.map(
        (catData) => CategoryItem(catData.id,catData.title,catData.color)
      ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, 
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      childAspectRatio: 3/2,
      ),
    
    ) ;
  }
}