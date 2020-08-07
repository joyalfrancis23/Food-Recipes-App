import 'package:Meals_app/screens/main_drawer_screen.dart';
import 'package:flutter/material.dart';
import '../model/meals.dart';
import './category_screen.dart';
import './favorites_screen.dart';
class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal; 
  TabsScreen(this.favoriteMeal);
  @override
  TabsScreenState createState() => TabsScreenState();
}

class TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPage = 0;
  @override
  void initState() {
     _pages = [
    {'page':CategoriesScreen(),'title':'Mouth Watering Recipes'},
    {'page':FavoritesScreen(widget.favoriteMeal),'title':'Your Favorites'}
  ];
    super.initState();
  }
  void _selectPage(int index){
    setState(() {
      
      _selectedPage = index;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(_pages[_selectedPage]['title'],)),
        
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
       unselectedItemColor: Colors.black54,
       selectedItemColor: Colors.red,
       currentIndex: _selectedPage,
       type: BottomNavigationBarType.shifting,
        onTap: _selectPage ,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.category),title: Text('Categories'),),
        BottomNavigationBarItem(icon: Icon(Icons.star),title: Text('Favorites'),),
      ]),
    
    );
  }
}