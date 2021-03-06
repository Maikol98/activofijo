import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:softwareproject/src/models/revision_tecnica_mantenimiento_page.dart';

class RevisionMantenimientoProvider {
  String _url     = 'fierce-dawn-95981.herokuapp.com';
  
  Future<List<RevisionMantenimiento>> getRevisionMantenimiento() async {
    final url = Uri.https(_url,'/api/RevisionTecnica/Mantenimiento');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new RevisionMantenimientos.fromJsonList(decodeData);
    
    return dato.items;
  }

}