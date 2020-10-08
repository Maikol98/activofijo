import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softwareproject/src/models/Depresiacion.dart';

class DepreciacionProvider{

  String _url = 'fierce-dawn-95981.herokuapp.com';
  
  //index
  Future<List<Depreciacion>> depreciacionIndex() async{
    final url = Uri.https(_url, 'api/Depreciacion');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final usuario = new Depreciaciones.fromJsonList(decodeData);
    return usuario.items;
  }

}