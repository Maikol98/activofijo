import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:softwareproject/src/models/revision_tecnica_model.dart';

class RevisionProvider {
  String _url     = 'fierce-dawn-95981.herokuapp.com';
  
  Future<List<Revision>> getRevision() async {
    final url = Uri.https(_url,'/api/RevisionTecnica');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Revisiones.fromJsonList(decodeData);
    
    return dato.items;
  }

}