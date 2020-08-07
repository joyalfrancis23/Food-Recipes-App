import 'package:flutter/material.dart';
import './filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title,IconData icon,Function filterActivation ){
    return ListTile(
          leading:Icon(icon,size:26,), 
          title: Text(title,
          style: TextStyle(
            fontFamily:'Roboto Condensed',
            fontSize:24,
            fontWeight:FontWeight.bold
          ),
          ),
          onTap: (){
            return filterActivation();
          },
        );
  }
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child:Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(15),
          color: Theme.of(context).primaryColor,
          height: 120,
          width: double.infinity,
          child: Center(
            child: Text('Cooking up!!!',
            style: TextStyle(fontSize: 28,
              color: Colors.white,
            fontWeight:FontWeight.bold)
            ),
          ),
        ),
        SizedBox(height:10),
        buildListTile('Meals', Icons.restaurant,
        (){
          Navigator.of(context).pushNamed('/');
        }
        
        ),
        buildListTile('Filters', Icons.settings,
        (){
          Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
        }
        ),
      ],)
    );
  }
}