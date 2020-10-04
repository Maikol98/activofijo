import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:softwareproject/src/models/revision_tecnica_mantenimiento_page.dart';

class TranferenciaProvider {
  String _url     = 'fierce-dawn-95981.herokuapp.com';
  
  Future<List<RevisionMantenimiento>> getRevision() async {
    final url = Uri.https(_url,'/api/RevisionTecnica/Mantenimiento');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new RevisionMantenimientos.fromJsonList(decodeData);
    
    return dato.items;
  }

}