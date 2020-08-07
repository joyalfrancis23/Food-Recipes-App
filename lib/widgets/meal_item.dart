import 'package:flutter/material.dart';
import '../model/meals.dart';
import '../screens/meal_details_screen.dart';
class MealItem extends StatelessWidget {
  
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final String imageURL;
  final int duration;
  final String id;
  
  MealItem({
    this.title,this.complexity,this.affordability,this.imageURL,this.duration,this.id
  });

  String get complexityText{
    switch(complexity){

      case Complexity.Challenging:
      return 'Challenging';
      break;

      case Complexity.Hard:
      return 'Hard';
      break;
     
      case Complexity.Simple:
      return 'Simple';
      break;
      default :
      return 'Unknown';
    }
  }

  String get affordabilityText{
    switch(affordability){

      case Affordability.Affordable:
      return 'Affordable';
      break;

      case Affordability.Pricey:
      return 'Pricey';
      break;
     
      case Affordability.Luxurious:
      return 'Luxurious';
      break;
      default :
      return 'Unknown';
    }
  }
  void selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(
      MealsDetailsScreen.routeName,
      arguments: id,
      
    ).then((value) {
      if(value!=null){
     // removeItem(value);
    }});
  }
  @override
  
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        margin: EdgeInsets.all(7),
        child: Column(
          children: <Widget>[
            Stack(
              
              children: <Widget>[
                ClipRRect(borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ) ,
                child: Image.network(imageURL),
                
                ),
              Positioned(
                bottom: 20,
                right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                      child: Text(
                  title,
                  style: TextStyle(fontSize:26,color: Colors.white),
                  overflow: TextOverflow.fade,
                  softWrap: true,
                ),
                    ),
              ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.schedule),
                  SizedBox(width:2),
                  Text('$duration min'),
                  SizedBox(width:2),
                  Icon(Icons.attach_money),
                  SizedBox(width:2),
                  Text(affordabilityText),
                  SizedBox(width:2),
                  Icon(Icons.work),
                  SizedBox(width:2),
                  Text(complexityText),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}