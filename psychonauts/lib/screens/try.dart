import 'package:flutter/material.dart';
import 'package:psychonauts/Models/Response.dart';
import 'package:psychonauts/helpers/api_herper.dart';
class Tryview extends StatefulWidget {
  const Tryview({ Key? key }) : super(key: key);

  @override
  _TryviewState createState() => _TryviewState();
}

class _TryviewState extends State<Tryview> {
  List<dynamic> _Users=[];
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
   Response response = await ApiHelper.getUsers2();
   if(response.result==null)
   {
    _isFiltered = false;
   }else{
     _noContent();
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
          ? 'Servicio No disponible'
          : 'Servicio no disponible',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }

 Widget _getListView() {
   return Scaffold(
      appBar: AppBar(
      title: Text('Lista personajes'),      
    ),
    body: ListView(
      children: _Users
          .map(
            (item) => Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
               Container(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        height: 200,
                        width: 300,
                        color: Colors.white,
                        alignment: Alignment.center,                         
                        child: Image.network(item['img']),                        
                      )],),
                      Column(children:<Widget> [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[                           
                            
                            Text("Genero: ", style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold,),textAlign: TextAlign.center, ),                        
                            Text(item['gender'], style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),
                            SizedBox(height: 30,),
                          ],                          
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Id: ", style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold)),
                            Text(item['_id'], style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold)),
                            
                          ],                          
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                          
                          Text("Name: ", style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'RobotoMono' )),
                          Text(item['name'], style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: 'RobotoMono' )),
                          SizedBox(height: 20)
                        ],)
                      ],),
              
              //Mostar itemsSizedBox(height: 10),
              SizedBox(height: 10),
              Text('Poderes:',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'RobotoMono' )),
              Column(
                 
                  children: (item['psiPowers'] as List)
                      .map(
                        (subItem) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(subItem['name'],style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.bold,fontFamily: 'RobotoMono' )),
                          ],
                        )
                            // titulo del item aqui
                            
                      )
                      .toList()
                      ),
               SizedBox(height: 28)      
            ]
            ),
          )
          .toList(),
    
   )
   );
 }
}

 


 

