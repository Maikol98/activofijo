import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:softwareproject/src/models/operador_model.dart';

class OperadorProvider {
  String _url     = 'fierce-dawn-95981.herokuapp.com';
  
  Future<List<Operador>> getOperador() async {
    final url = Uri.https(_url,'/api/Operador');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);

    final dato = new Operadores.fromJsonList(decodeData);
  
    return dato.items;

  }

}