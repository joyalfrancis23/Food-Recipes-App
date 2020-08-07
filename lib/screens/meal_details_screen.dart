import 'package:flutter/material.dart';

import '../category_list.dart';

class MealsDetailsScreen extends StatelessWidget {
  static const routeName='/meal-details-screen';
  final Function toggleFavorite;
  final Function isFavorite;
  MealsDetailsScreen(this.toggleFavorite,this.isFavorite);
  Widget buildSectionTitle(BuildContext context,String text){

    return Container(margin: EdgeInsets.all(10),
              child: Text(text,style:TextStyle(color: Colors.black87,fontWeight: FontWeight.bold,fontSize: 26),
            ),
            );
  }
  Widget buildContainer(BuildContext context,Widget child){
    return Container(padding: EdgeInsets.all(10),height: MediaQuery.of(context).size.height*0.3,width: MediaQuery.of(context).size.width*0.85,
              decoration: BoxDecoration(
                color:Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color:Colors.grey),
    
              ),
              child:child,
              );
  }
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id==mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),),
          body: SingleChildScrollView(
                      child: Column(children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child:Image.network(selectedMeal.imageUrl,fit: BoxFit.cover
              ),
              ),
              buildSectionTitle(context,'Ingredients'),
                buildContainer(
                  context ,ListView.builder(itemBuilder: (ctx,index)=>Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                  
                  itemCount: selectedMeal.ingredients.length,
                  ),
                  
                ),
                buildSectionTitle(context,'Steps'),
                Container(padding: EdgeInsets.all(10),
                  child: buildContainer(context,
                  ListView.builder(itemBuilder: (ctx,index)=>Column(
                                      children:[ListTile(
                      leading: CircleAvatar(
                        child:Text('#${index+1}')
                      ),
                      title: Text(selectedMeal.steps[index]),
                      ),Divider(),] ,
                      
                  ),
                    itemCount: selectedMeal.steps.length,
                    ),
                  ),
                ),

            ],),
          ),
          floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId)?Icons.star:Icons.star_border,
        ),
        onPressed: ()=> toggleFavorite(mealId),
      ),
    );
  }
}