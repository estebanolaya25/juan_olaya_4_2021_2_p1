
import 'package:psychonauts/Models/Psychonauts.dart';
import 'package:psychonauts/Models/Response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'constans.dart';

class ApiHelper
{

  static Future<Response> getUsers() async {
    
    var url=Uri.parse('${Constans.apiUrl}/api/characters');
    var response =await http.get(url);    
    List<Psychonauts> data1=[];//=json.decode(response.body); 
    final data=json.decode(response.body);
    
    for(var item in data)
    {
      data1.add(Psychonauts(gender: item["gender"], img: item["img"], iV: 0, name: item["name"], psiPowers: [], sId: item["_id"]));
    }
    return Response(isSuccess: true,result: data1);
  }

  static Future<Response> getUsers2() async {
    
    var url=Uri.parse('${Constans.apiUrl}/api/characters');
    var response =await http.get(url);    
    List<Psychonauts> data1=[];//=json.decode(response.body); 
    final data=json.decode(response.body);
    
    
    return Response(isSuccess: true,result: data);
  }

}