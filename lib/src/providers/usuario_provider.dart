import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:softwareproject/src/models/usuarios.dart';

class UsuarioProvider{

  String _url = 'fierce-dawn-95981.herokuapp.com';
  
  //Gestionar Usuario
  Future<List<Respuesta>> usuarioIndex() async{
    final url = Uri.https(_url, 'api/UsuarioMovil');

    final resp = await http.get(url);
    final decodeData = json.decode(resp.body);
    final usuario = new Respuestas.fromJsonList(decodeData);
    return usuario.items;
  }
  
  
  Future<Respuesta> crearusuario(Map<String, dynamic> datos) async{
    final url = Uri.https(_url, 'api/UsuarioMovil');

    final resp = await http.post(url,body: datos);
    final decodeData = json.decode(resp.body);
    final usuario = new Respuesta.fromJsonMap(decodeData);
    return usuario;
  }



  Future<Respuesta> editUsuario(int codigo, Map<String,dynamic> datos) async{
    final url = Uri.https(_url, 'api/UsuarioMovil/$codigo');

    final resp = await http.put(url,body: datos);
    final decodeData = json.decode(resp.body);
    final usuario = new Respuesta.fromJsonMap(decodeData);
    return usuario;
  }

}