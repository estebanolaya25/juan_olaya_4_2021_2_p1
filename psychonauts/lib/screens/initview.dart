import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:psychonauts/Models/Psychonauts.dart';
import 'package:psychonauts/components/loader_component.dart';
import 'package:psychonauts/helpers/constans.dart';

import 'listscreen.dart';
class InitView extends StatefulWidget {
  const InitView({ Key? key }) : super(key: key);

  @override
  _InitViewState createState() => _InitViewState();
}

class _InitViewState extends State<InitView> {
   bool _showLoader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                  _showLogo(),
                SizedBox(height: 20,),
               _showButton()
               ],
            ),
          ),
         _showLoader ? LoaderComponent(text: 'Por favor espere...') : Container(),
        ],
        ),
    );
  }

 Widget _showLogo() {
     return Image(
     image: AssetImage('assets/Psychonauts.jpg'),  
      width: 300,
      fit: BoxFit.fill,   
     );
  }

  _showPsychonauts() {
    return Expanded(
      child: ElevatedButton(
        child: Text('Psychonauts'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return Color(0xFF120E43);
            }
          ),
        ),
        onPressed: () => _ConsultPsychonauts(), 
      ),
    );
  }

  _showButton() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _showPsychonauts(),
        ],
      ),
    );
  }

   _ConsultPsychonauts() async {
    setState(() {
      _showLoader = true;
    });

    var url=Uri.parse('${Constans.apiUrl}/api/characters');
    var response =await http.get(url);
    List<Psychonauts>data1=[];
    //List<dynamic> data=json.decode(response.body); 
    final data=json.decode(response.body); 

    for(var item in data)
    {
      data1.add(Psychonauts(gender: item["gender"], img: item["img"], iV: 0, name: item["name"], psiPowers: [], sId: item["img"]));
    }
    
    setState(() {
      _showLoader = true;
    });

    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => ListScreen()
      )
    );
    

 /* for (var item in data)
  {

    data1.add(new Psychonauts(gender:item["gender"], img:item["img"], iV: 0, name: item["name"], psiPowers: item["psiPowers"], sId: '',));
    
  }
for (var item in data1)
  {

    print(item.name);
    
  }*/

  




   /*for (int i=0;i<data.length;i++)
   {
     print(data[i]);
   }*/
  

    setState(() {
      _showLoader = false;
    });

    var body = response.body;



   /* var decodedJson = jsonDecode(body);
    var List = Token.fromJson(decodedJson);
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => HomeScreen(token: token,)
      )
    );*/
  }
}
