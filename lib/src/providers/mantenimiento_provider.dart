import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:softwareproject/src/models/mantenimiento_model.dart';

class MantenimientoProvider {
  String _url     = 'fierce-dawn-95981.herokuapp.com';

  Future<List<Mantenimiento>> getMantenimiento() async {
    final url = Uri.https(_url,'/api/Mantenimiento');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);

    final dato = new Mantenimientos.fromJsonList(decodeData);
  
    return dato.items;

  }


}