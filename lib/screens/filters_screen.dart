import 'package:flutter/material.dart';
import './main_drawer_screen.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName = 'Filter-Screen';
    final Function saveFilters;
    final Map<String,bool> currentFilters;
    FiltersScreen(this.saveFilters,this.currentFilters,);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  
  bool _glutenFree=false;

  bool _vegitarian=false;

  bool _vegan=false;

  var _lactoseFree=false;
  @override
  initState(){
    _glutenFree=widget.currentFilters['gluten'];
    _vegitarian=widget.currentFilters['vegitarian'];
    _vegan=widget.currentFilters['vegan'];
    _lactoseFree=widget.currentFilters['lactoseFree'];
    super.initState();
  }
  Widget _switchBuilderWidget(

    String title,
    String secondTitle,
    bool currentValue,
    Function updateValue
    
    ){
       return SwitchListTile(
                      title:Text(title) ,
                      value: currentValue,
                      subtitle: Text(secondTitle),
                      onChanged: updateValue,
                      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings',
        

        style: TextStyle(fontSize:24,fontFamily:Theme.of(context).textTheme.bodyText1.fontFamily)
        ),
        actions: <Widget>[

          IconButton(icon: Icon(Icons.save), onPressed:(){ 
            final selectedFilter ={
    'gluten':_glutenFree,
    'vegitarian':_vegitarian,
    'vegan':_vegan,
    'lactoseFree':_lactoseFree,
            };
            widget.saveFilters(selectedFilter); 
            })

        ],
      ),
      drawer: MainDrawer() ,
          body: Column(
            children: <Widget>[
              Container(padding: EdgeInsets.all(20)
                ,child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.headline1),
                ),
                Expanded(child: ListView(
                  children: <Widget>[
                   _switchBuilderWidget(
                     'Gluten Free',
                     'Only includes gluten free meals',
                     _glutenFree,
                     (valueChange){
                       setState((){
                       _glutenFree=valueChange;
                     },);
                     }
                   ),
                   _switchBuilderWidget(
                     'Vegitarian',
                     'Only includes vegitarian meals',
                     _vegitarian,
                     (valueChange){
                       setState((){
                       _vegitarian=valueChange;
                     },);
                     }
                   ),
                   _switchBuilderWidget(
                     'Vegan',
                     'Only includes vegan meals',
                     _vegan,
                     (valueChange){
                       setState((){
                       _vegan=valueChange;
                     },);
                     }
                   ),
                   _switchBuilderWidget(
                     'Lactose Free',
                     'Only includes lactose free meals',
                     _lactoseFree,
                     (valueChange){
                       setState((){
                       _lactoseFree=valueChange;
                     },);
                     }
                   ),
                  ],
                ))
            ],
          ),
    );
  }
}