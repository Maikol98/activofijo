import 'package:http/http.dart' as http;
import 'package:softwareproject/src/models/bien_model.dart';
import 'package:softwareproject/src/models/custodio.mode.dart';
import 'package:softwareproject/src/models/operador_model.dart';
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

  Future<List<Custodio>> getCustodio() async {
    final url = Uri.https(_url,'/api/Custodio');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Custodios.fromJsonList(decodeData);
    return dato.items;
  }

  Future<List<Bien>> getBien() async {
    final url = Uri.https(_url,'/api/Bien');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Bienes.fromJsonList(decodeData);
    
    return dato.items;
  }

    Future<List<Operador>> getOperador() async {
    final url = Uri.https(_url,'/api/Operador');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Operadores.fromJsonList(decodeData);
    
    return dato.items;
  }

  Future<int> postDatos(Map<String,String> datos) async{

    final url = Uri.http(_url, 'api/RevisionTecnica/create');
    final resp = await http.post(url,body: datos);

    return json.decode(resp.body);
    
  }

}