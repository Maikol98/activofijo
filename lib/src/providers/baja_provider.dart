import 'package:http/http.dart' as http;
import 'package:softwareproject/src/models/baja_model.dart';

import 'dart:convert';


class BajaProvider {
  String _url     = 'fierce-dawn-95981.herokuapp.com';

  Future<List<Baja>> getBaja() async {
    final url = Uri.https(_url,'/api/Baja');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);

    final bajas = new Bajas.fromJsonList(decodeData);
  
    return bajas.items;

  }


  Future<int> postDatos(Map<String,String> datos) async{

    final url = Uri.http(_url, 'api/Baja/create');
    final resp = await http.post(url,body: datos);

    return json.decode(resp.body);
    
  }


}