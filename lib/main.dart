import 'dart:ui';



import 'package:flutter/material.dart';
import 'screens/tabs_screen.dart';
import './screens/meal_details_screen.dart';
import 'screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './category_list.dart';
import './model/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

 void _toggleFavorite(String mealId){
   final exsistingIndex = _favoritesMeals.indexWhere((element) => element.id==mealId);
   if (exsistingIndex>=0){
     setState(() {
       _favoritesMeals.removeAt(exsistingIndex);
     });
   }
   else{
     setState(() {
       _favoritesMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==mealId));
     });
   }
 }
 bool isMealFavorite(String id){
   return _favoritesMeals.any((element) => element.id==id);
 }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      
      initialRoute: '/', 
      routes: {
        '/': (ctx) => TabsScreen(_favoritesMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealsDetailsScreen.routeName: (ctx) => MealsDetailsScreen(_toggleFavorite,isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen( _setFilters,_filters,),
      },
      
      
    );
  }
}
