import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softwareproject/src/models/almacen_model.dart';
import 'package:softwareproject/src/models/bien_model.dart';
import 'package:softwareproject/src/models/categoria_model.dart';
import 'package:softwareproject/src/models/departamento_model.dart';
import 'package:softwareproject/src/models/rubro_model.dart';

class BienProvider{

  String _url = 'fierce-dawn-95981.herokuapp.com';
  
  //index
  Future<List<Bien>> bienIndex() async{
    final url = Uri.https(_url, 'api/BienMovil');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final usuario = new Bienes.fromJsonList(decodeData);
    return usuario.items;
  }

  //Departamento
  Future<List<Departamento>> getDepartamento() async{
    final url = Uri.https(_url, 'api/Departamento');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final data = new Departamentos.fromJsonList(decodeData);
    return data.items;
  }

  //Almacen
  Future<List<Almacen>> getAlmacen() async{
    final url = Uri.https(_url, 'api/Almacen');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final data = new Almacenes.fromJsonList(decodeData);
    return data.items;
  }

  //Rubro
  Future<List<Rubro>> getRubro() async{
    final url = Uri.https(_url, 'api/Rubro');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final data = new Rubros.fromJsonList(decodeData);
    return data.items;
  }

  //Categoria
  Future<List<Categoria>> getCategoria() async{
    final url = Uri.https(_url, 'api/Categoria');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final data = new Categorias.fromJsonList(decodeData);
    return data.items;
  }

  Future<int> postDatos(Map<String,String> datos) async{

    final url = Uri.http(_url, 'api/Bien/create');
    final resp = await http.post(url,body: datos);

    return json.decode(resp.body);
    
  }

}