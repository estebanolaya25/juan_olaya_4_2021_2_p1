import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:psychonauts/Models/Psychonauts.dart';

import 'package:psychonauts/Models/Response.dart';
import 'package:psychonauts/helpers/api_herper.dart';
class ListScreen extends StatefulWidget {
  //final List<Psychonauts> lstPsychonauts; 
  ListScreen();  
 //ListScreen({required this.lstPsychonauts});
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {  
  List<Psychonauts> _Users=[];
  bool _isFiltered=false;
  @override
  void initState() {
    super.initState();
    _getPsychonauts();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _getListView()
        ],
      ),
    );
  }

 Future<Null> _getPsychonauts() async{
   Response response = await ApiHelper.getUsers();
   if(response.result==null)
   {
    _isFiltered = false;
   }

   
    setState(() {
      _Users = response.result;
    });

 }



Widget _noContent() {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Text(
          _isFiltered
          ? 'No hay usuarios con ese criterio de búsqueda.'
          : 'No hay usuarios registradas.',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

Widget _getListView()
{
  return  Scaffold(
    appBar: AppBar(
      title: Text('Lista personajes'),
    ),
    body: Column(  
      children: [
        Expanded(child: ListView.builder(
          itemCount:_Users.length,
          itemBuilder: (BuildContext context,int index){
            return Card(
              child: Column(
                children: <Widget>[
                 
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        height: 144,
                        width: 150,
                        color: Colors.white,
                        alignment: Alignment.centerLeft,                         
                        child: Image.network(_Users[index].img),                        
                      )
                        ],
                      ),
                      Column(children: [
                        Row(
                          children: [
                            Text(_Users[index].sId, style: TextStyle(fontSize: 16,color: Colors.green))
                          ],                          
                        ),
                        Row(
                          children: [
                            Text(_Users[index].name, style: TextStyle(fontSize: 16,color: Colors.green))
                          ],                          
                        ),
                        Row(children: [
                          Text(_Users[index].gender, style: TextStyle(fontSize: 16,color: Colors.green))
                        ],)
                      ],)
                      
                      
                      
                    ],
                    
                  ),
                  
                  
                 
                ],
              ),
              
              
            );
          }))
      ],   

     
    ),
  );
  

  
}

}