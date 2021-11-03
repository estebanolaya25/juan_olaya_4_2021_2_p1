import 'dart:convert';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:psychonauts/Models/Psychonauts.dart';
import 'package:psychonauts/components/loader_component.dart';
import 'package:psychonauts/helpers/constans.dart';
import 'package:psychonauts/screens/try.dart';

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
                 _showLogoTitle(),
                 SizedBox(height: 10),
                  _showLogo(),
                SizedBox(height: 20),
               _showButton(),
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

  Widget _showLogoTitle() {
     return Image(
     image: AssetImage('assets/Psychonauts2.jpg'),  
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
  _showPsychonauts2() {
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
        onPressed: () => _ConsultPsychonauts2(), 
      ),
    );
  }

  _showButton() {
    return Container(     
      child: Row(        
        children: <Widget>[
          _showPsychonauts(),
          SizedBox(height: 10),
          //_showPsychonauts2(),

        ],
      ),
    );
  }

   _ConsultPsychonauts() async {

var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _showLoader = false;
      });
      await showAlertDialog(
        context: context,
        title: 'Error', 
        message: 'Verifica que estes conectado a internet.',
        actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
        ]
      );    
      return;
    }

    setState(() {
      _showLoader = true;
    });

    /*var url=Uri.parse('${Constans.apiUrl}/api/characters');
    var response =await http.get(url);
    List<Psychonauts>data1=[];
    //List<dynamic> data=json.decode(response.body); 
    final data=json.decode(response.body); 

    for(var item in data)
    {
      data1.add(Psychonauts(gender: item["gender"], img: item["img"], iV: 0, name: item["name"], psiPowers: [], sId: item["img"]));
    }*/
    
   

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => Tryview()//ListScreen()Tryview()
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

   // var body = response.body;



   /* var decodedJson = jsonDecode(body);
    var List = Token.fromJson(decodedJson);
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(
        builder: (context) => HomeScreen(token: token,)
      )
    );*/
  }
  _ConsultPsychonauts2() async {

var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _showLoader = false;
      });
      await showAlertDialog(
        context: context,
        title: 'Error', 
        message: 'Verifica que estes conectado a internet.',
        actions: <AlertDialogAction>[
            AlertDialogAction(key: null, label: 'Aceptar'),
        ]
      );    
      return;
    }

    setState(() {
      _showLoader = true;
    });
    
   

    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (context) => ListScreen()
      )
    ); 

    setState(() {
      _showLoader = false;
    });   
  }
}
