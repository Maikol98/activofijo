import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:softwareproject/src/models/tranferencia_model.dart';

final String _url     = 'fierce-dawn-95981.herokuapp.com';

class TranferenciaProvider {

  Future<List<Tranferencia>> getTranferencia() async {
    final url = Uri.https(_url,'/api/Tranferencia');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Tranferencias.fromJsonList(decodeData);
    
    return dato.items;

  }

}

class TranferenciaCreateProvider{

}