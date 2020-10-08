
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softwareproject/src/models/custodio_mode.dart';
import 'package:softwareproject/src/models/operador_model.dart';
import 'package:softwareproject/src/models/responsable_model.dart';

class EmpleadoProvider{

  String _url = 'fierce-dawn-95981.herokuapp.com';


  Future<List<Custodio>> listarCustodio() async{
    final url = Uri.https(_url, 'api/listarCustodio');
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final custodio = new Custodios.fromJsonList(decodeData);
    return custodio.items;
  }

  //Responsable
    Future<List<Responsable>> listarResponsable() async{
    final url = Uri.https(_url, 'api/listarOperador');
    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final operador = new Responsables.fromJsonList(decodeData);
    return operador.items;
  }

  //
  Future <List<Operador>> listarOperador() async{
  final url= Uri.https(_url, 'api/listarOperador');
  final resp = await http.get(url);
  final decodeData = json.decode(resp.body);
  final operador = new Operadores.fromJsonList(decodeData);
  return operador.items;


}


}