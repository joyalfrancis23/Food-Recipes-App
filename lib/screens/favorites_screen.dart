import 'package:flutter/material.dart';
import '../model/meals.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoritesMeals;
  FavoritesScreen(this.favoritesMeals);
  @override
  Widget build(BuildContext context) {
    if (favoritesMeals.isEmpty){
    return Center(
     child: Text('You havent added any favorites yet...')
    );
    }
    else{
      return ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
          title: favoritesMeals[index].title,
          complexity: favoritesMeals[index].complexity,
          affordability: favoritesMeals[index].affordability,
          imageURL: favoritesMeals[index].imageUrl,
          duration: favoritesMeals[index].duration,
          id: favoritesMeals[index].id,
          
        );
      },
      itemCount: favoritesMeals.length,
      );
    }
  }
}