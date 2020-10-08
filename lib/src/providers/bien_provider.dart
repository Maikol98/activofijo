import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softwareproject/src/models/bien_model.dart';

class BienProvider{

  String _url = 'fierce-dawn-95981.herokuapp.com';
  
  //index
  Future<List<Bien>> bienIndex() async{
    final url = Uri.https(_url, 'api/BienMovil');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final usuario = new Bienes.fromJsonList(decodeData);
    return usuario.items;
  }

}