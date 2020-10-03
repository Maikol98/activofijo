import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:softwareproject/src/models/bien_model.dart';
import 'package:softwareproject/src/models/custodio.mode.dart';
import 'package:softwareproject/src/models/responsable.model.dart';
import 'package:softwareproject/src/models/tranferencia_model.dart';
import 'package:softwareproject/src/models/ubicacion_model.dart';

class TranferenciaProvider {
  String _url     = 'fierce-dawn-95981.herokuapp.com';
  
  Future<List<Tranferencia>> getTranferencia() async {
    final url = Uri.https(_url,'/api/Tranferencia');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Tranferencias.fromJsonList(decodeData);
    
    return dato.items;
  }

   Future<List<Ubicacion>> getUbicacion() async {
    final url = Uri.https(_url,'/api/Ubicacion');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Ubicaciones.fromJsonList(decodeData);
    
    return dato.items;
  }

  Future<List<Custodio>> getCustodio() async {
    final url = Uri.https(_url,'/api/Ubicacion');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Custodios.fromJsonList(decodeData);
    
    return dato.items;
  }

  Future<List<Responsable>> getResponsable() async {
    final url = Uri.https(_url,'/api/Ubicacion');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Responsables.fromJsonList(decodeData);
    
    return dato.items;
  }

  Future<List<Bien>> getBien() async {
    final url = Uri.https(_url,'/api/Ubicacion');

    final resp = await http.get( url );
    final decodeData = json.decode(resp.body);
  
    final dato = new Bienes.fromJsonList(decodeData);
    
    return dato.items;
  }

}