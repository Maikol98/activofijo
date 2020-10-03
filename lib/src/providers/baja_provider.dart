import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:softwareproject/src/models/bitacora_model.dart';

class BitacoraProvider {
  String _url     = 'fierce-dawn-95981.herokuapp.com';

  Future<List<Bitacora>> getBitacora() async {
    final url = Uri.https(_url,'/api/Baja');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);

    final bajas = new Bitacoras.fromJsonList(decodeData);
  
    return bajas.items;

  }


}