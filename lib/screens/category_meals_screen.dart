

import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../model/meals.dart';
class CategoryMealsScreen extends StatefulWidget {
  // final String categoryid;
  // final String title;
  // CategoryMealsScreen(this.categoryid,this.title);
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> categoryMeals;
  var _loadedInitData=false;
  @override
  void initState(){

super.initState();
  }
  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
       final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
     title = routeArgs['title'];
    final categoryid = routeArgs['id'];
     categoryMeals = widget.availableMeals.where((meal){
      return meal.categories.contains(categoryid);
    }).toList();
    _loadedInitData=true;
    }
  
    super.didChangeDependencies();
  }
 
  Widget build(BuildContext context) {
     
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: Theme.of(context).textTheme.headline6),
      ),
      
      body: ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
          title: categoryMeals[index].title,
          complexity: categoryMeals[index].complexity,
          affordability: categoryMeals[index].affordability,
          imageURL: categoryMeals[index].imageUrl,
          duration: categoryMeals[index].duration,
          id: categoryMeals[index].id,
          
        );
      },
      itemCount: categoryMeals.length,
      ),
    ); 
  }
}